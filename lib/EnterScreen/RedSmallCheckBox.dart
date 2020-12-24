import 'package:flutter/material.dart';

class REDSmallCheckBox0Widget extends StatelessWidget {
  REDSmallCheckBox0Widget({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 20.0,
          height: 20.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: const Color(0xffffffff),
            border: Border.all(
              //width: CBase().borderPrimarySize,
              //color: CBase().borderPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
