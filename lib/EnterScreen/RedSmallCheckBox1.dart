import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class REDSmallCheckBox1Widget extends StatelessWidget {
  REDSmallCheckBox1Widget({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0,
      height: 20.0,
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
       // color: CBase().backgroundColor,
        border: Border.all(
          width: 1.0,
          //color: CBase().basePrimaryColor,
        ),
      ),
      child: SvgPicture.string(
        _svg_y7p8dv,
        allowDrawingOutsideViewBox: true,
        //color: CBase().basePrimaryColor,
      ),
    );
  }
}

const String _svg_y7p8dv =
    '<svg viewBox="8.2 10.5 17.5 11.7" ><path transform="translate(8.23, 10.5)" d="M 0 5.834640026092529 C 0 5.834640026092529 5.832503318786621 11.65574741363525 5.834640026092529 11.66928005218506 C 5.836777210235596 11.68281269073486 17.50392150878906 0 17.50392150878906 0" fill="none" stroke="#EF1B1B" stroke-width="3" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
