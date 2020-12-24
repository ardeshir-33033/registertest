import 'package:flutter/material.dart';

class REDButton extends StatelessWidget {
  Widget route;
  Function(dynamic result) onTapCallback;
  dynamic param;
  String title;

  REDButton({
    this.onTapCallback,
    this.param,
    this.route,
    this.title,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 100.0,
        height: 40.0,
        decoration: BoxDecoration(
          //color: CBase().basePrimaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(12.5),
          ),
          boxShadow: [
            BoxShadow(
                color: const Color(0x29000000),
                offset: Offset(0, 0),
                blurRadius: 6)
          ],
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.only(bottom: 5.0),
            child: Text(
              title ?? 'ادامه',
              style: TextStyle(
                //fontFamily: CBase().fontFamily,
                //fontSize: CBase().getTitlefontSizeByScreen(),
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      onTap: () {
        if (route != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => route,
            ),
          );
        }

        if (onTapCallback != null) {
          onTapCallback(param);
        }
      },
    );
  }
}
