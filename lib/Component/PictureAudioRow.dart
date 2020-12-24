import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:register/ApiModels/ApiRegisterModel.dart';
import 'package:register/Business/RegisterBusiness.dart';
import 'package:register/Service/EndPointService.dart';
import 'package:register/CameraStuff/Camera.dart';
import 'dart:io';
import 'audioPlayer.dart';

class PicAudio extends StatefulWidget {
  ApiRegisterModel register = ApiRegisterModel();
  Function() onPictureCallBack;

  PicAudio({this.register, this.onPictureCallBack});

  @override
  _PicAudioState createState() => _PicAudioState();
}

class _PicAudioState extends State<PicAudio> {
  bool inProgress = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              return showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      content: new SingleChildScrollView(
                        child: new ListBody(
                          children: <Widget>[
                            GestureDetector(
                                child: new Text(
                                  'گرفتن عکس',
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                                onTap: () {
                                  inProgress = true;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Camera(
                                        captureCallBack: (result) async {
                                          var capturesFile = File(result);
                                          RegisterBusiness()
                                              .setNewPicture(result);
                                          setState(() {});
                                          widget.onPictureCallBack();

                                          if (capturesFile != null) {
                                            var uploadResult =
                                                await RegisterBusiness()
                                                    .uploadImage(capturesFile,
                                                        widget.register.id);

                                            if (uploadResult.isSuccess) {
                                              inProgress = false;
                                              setState(() {});

                                              return showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      backgroundColor:
                                                          Colors.white,
                                                      content:
                                                          new SingleChildScrollView(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(right: 0),
                                                        child: Center(
                                                          child: Text(
                                                              'اطلاعات شما با موفقیت ثبت شد'),
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            }
                                            inProgress = false;
                                            Navigator.pop(context);
                                          }
                                        },
                                      ),
                                    ),
                                  );

                                  inProgress = false;
                                  setState(() {});
                                }),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                            ),
                            GestureDetector(
                                child: Text('انتخاب از گالری',
                                    style:
                                        TextStyle(color: Colors.grey.shade700)),
                                onTap: () async {
                                  inProgress = true;
                                  var selectedFile = await EndPointService()
                                      .getImageFromGallery(0, "image");

                                  if (selectedFile != null) {
                                    var uploadResult = await RegisterBusiness()
                                        .uploadImage(
                                            selectedFile, widget.register.id);
                                    widget.onPictureCallBack();
                                    if (uploadResult.isSuccess) {
                                      // RegisterBusiness()
                                      //     .setNewPicture(selectedFile.path);
                                      inProgress = false;

                                      setState(() {});
                                      return showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              backgroundColor: Colors.white,
                                              content:
                                                  new SingleChildScrollView(
                                                padding: const EdgeInsets.only(
                                                    right: 0),
                                                child: Center(
                                                  child: Text(
                                                      'اطلاعات شما با موفقیت ثبت شد'),
                                                ),
                                              ),
                                            );
                                          });
                                    }
                                  }

                                  //Navigator.pop(context);
                                  inProgress = false;
                                  setState(() {});
                                }),
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width / 5,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: SvgPicture.asset(
                'assets/images/camera.svg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          //imagePreviewer(),
          AudioPlayer1(
            AudioRecordedCallback: (result) async {
              var recordedFile = File(result);
              inProgress = true;
              if (recordedFile != null) {
                var uploadResult = await RegisterBusiness()
                    .uploadVoice(recordedFile, widget.register.id);

                if (uploadResult.isSuccess) {
                  RegisterBusiness().setAudioFile(result);
                  inProgress = false;

                  return showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          content: new SingleChildScrollView(
                            padding: const EdgeInsets.only(right: 0),
                            child: Center(
                              child: Text('اطلاعات شما با موفقیت ثبت شد'),
                            ),
                          ),
                        );
                      });
                }
              }

              inProgress = false;
            },
          ),
        ],
      ),
    );
  }
}
