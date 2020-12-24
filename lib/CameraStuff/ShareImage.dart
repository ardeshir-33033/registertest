import 'dart:io';

import 'package:flutter/material.dart';
import 'package:register/Business/RegisterBusiness.dart';
import 'Gallery.dart';
import 'CameraMain.dart';

class ShareImage extends StatelessWidget {
  final String imagePath;

  const ShareImage({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //   ),
      //   actions: [
      //     IconButton(
      //         icon: Icon(Icons.delete),
      //         onPressed: () {
      //           File(imagePath).delete();
      //           Navigator.popAndPushNamed(context, '/');
      //         }),
      //     // IconButton(
      //     //     icon: Icon(Icons.share),
      //     //     onPressed: () {
      //     //       Share.shareFiles([imagePath]);
      //     //     })
      //   ],
      // ),
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Hero(
            tag: "$imagePath",
            child: Image.file(
              File(imagePath),
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {
                  File(imagePath).delete();
                  var paths = RegisterBusiness()
                      .getPictures()
                      .where((element) => element != imagePath)
                      .toList();
                  RegisterBusiness().setNewPictures(paths);
                },
                child: Icon(Icons.delete),
              ),
            ),
          )
        ],
      ),
    );
  }
}
