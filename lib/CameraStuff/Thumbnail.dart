import 'package:flutter/material.dart';
import 'dart:io';
import 'ShareImage.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class Thumbnail extends StatelessWidget {
  final String imagePath;

  const Thumbnail({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          timeDilation = 2.5;
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
                return ShareImage(imagePath: imagePath);
              }));
        },
        child: Hero(
            tag: "$imagePath",
            child: Image.file(
              File(imagePath),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            )

          /*Image.asset(
          imagePath,
          width: 100,
          height: 100,
          fit:BoxFit.cover
        ),*/
        ),
      ),
    );
  }
}
