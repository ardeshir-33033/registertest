import 'package:flutter/material.dart';
import 'package:register/Business/RegisterBusiness.dart';
import 'Camera.dart';
import 'Storage.dart';
import 'Gallery.dart';

class CamMain extends StatefulWidget {
  Function(dynamic result) TakePictureCallback;

  CamMain({
    @required this.TakePictureCallback,
  });

  @override
  _CamMainState createState() => _CamMainState();
}

class _CamMainState extends State<CamMain> {
  //static List<String> path = [];

  void _updateGallery() {
    Storage.getFilePaths().then((paths) {
      setState(() {
        RegisterBusiness().setNewPictures(paths);
      });
    });

    if (widget.TakePictureCallback != null) {
      widget.TakePictureCallback("");
    }
  }

  @override
  void initState() {
    super.initState();
    // Storage.getFilePaths().then((paths) {
    //   setState(() {
    //     path = paths;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Camera(
          captureCallBack: (result) {},
        ),
        Align(
          alignment: Alignment(0, 0.95),
          child: Container(
            height: 100,
            child: Gallery(
              paths: RegisterBusiness().getPictures(),
            ),
          ),
        )
      ],
    );
  }

  // List<String> getPaths() {
  //   return path ?? List<String>();
  // }
}
