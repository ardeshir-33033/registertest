import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Storage.dart';

class Camera extends StatefulWidget {
  final Function(String result) captureCallBack;

  const Camera({
    Key key,
    @required this.captureCallBack,
  }) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  List<CameraDescription> cameras;
  CameraController _controller;
  bool isCameraInitialized = false;

  void _initializedController() {
    _controller = CameraController(cameras[0], ResolutionPreset.medium);
    _controller.initialize().then((_) {
      if (!mounted) return;
      setState(() {
        isCameraInitialized = true;
      });
    });
  }

  _getcameras() async {
    cameras = await availableCameras();
    if (cameras.length > 0) _initializedController();
  }

  @override
  void initState() {
    super.initState();
    _getcameras();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<String> _captureImage() async {
    var path = await Storage.getFieldPath();
    var completer = Completer<String>();
    if (!_controller.value.isTakingPicture)
      try {
        await _controller.takePicture(path);
        widget.captureCallBack("");

        completer.complete(path);
      } on CameraException catch (e) {
        throw Exception('failed to capture image $e');
      }
    var result = await completer.future;

    if (widget.captureCallBack != null) {
      widget.captureCallBack(result);
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;

    if (!isCameraInitialized)
      return Container();
    else
      return Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey,
          ),
          Transform.scale(
            scale: _controller.value.aspectRatio / deviceRatio,
            child: Center(
              child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: CameraPreview(_controller)),
            ),
          ),
          Center(
              child: Theme(
                  data: ThemeData(
                    accentColor: Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                  child: FloatingActionButton(
                    onPressed: () {
                      _captureImage();
                    },
                    child: Icon(
                      Icons.camera,
                      size: 30,
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                    ),
                  ))),
        ],
      );
  }
}
