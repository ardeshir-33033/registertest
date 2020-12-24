import 'package:flutter/material.dart';
import 'Thumbnail.dart';

class Gallery extends StatelessWidget {
  final List<String> paths;

  const Gallery({Key key, this.paths}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: paths.length,
      // ignore: missing_return
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(5),
          child: Thumbnail(
            imagePath: paths[index],
          ),
        );
      },
    );
  }
}
