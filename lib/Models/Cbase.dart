import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:register/Business/ProfileService.dart';

class CBase {
  Color basePrimaryColor = Color(0xffca1237);
  Color basePrimaryLightColor = Color(0xfff3728c);
  Color borderPrimaryColor = Color(0xffcbcbcb);
  Color textPrimaryColor = Color(0xff878787);
  Color textLightPrimaryColor = Color(0xffcbcbcb);
  Color backgroundColor = Color(0xfff7f4f8);
  Color linkColor = Colors.blueAccent;
  String fontFamily = "IRANSans";
  // small
  double slargefontSize = 20;
  double stitlefontSize = 17;
  double ssubTitlefontSize = 13;
  double stextfontSize = 10;
  double ssmallTextfontSize = 9;
  // medium
  double mlargefontSize = 19;
  double mtitlefontSize = 14;
  double msubTitlefontSize = 10;
  double mtextfontSize = 10;
  double msmallTextfontSize = 10;
  // large
  double llargefontSize = 20;
  double ltitlefontSize = 16;
  double lsubTitlefontSize = 13;
  double ltextfontSize = 11;
  double lsmallTextfontSize = 10;

  double borderPrimarySize = 0.5;
  double boxHeight = 60.0;
  double radius = 10.0;
  TextAlign textAlignRight = TextAlign.right;
  TextDirection rtl = TextDirection.rtl;
  EdgeInsets smallEdge = EdgeInsets.all(5.0);
  EdgeInsets normallEdge = EdgeInsets.all(10.0);
  EdgeInsets largeEdge = EdgeInsets.all(15.0);
  EdgeInsets exLargeEdge = EdgeInsets.all(20.0);
  EdgeInsets contentEdge = EdgeInsets.only(top: 70.0);
  BoxDecoration boxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  );
  BoxDecoration titleBoxDecoration = BoxDecoration(
    border: Border(
      top: BorderSide(
        width: 0.5,
        color: Color(0xffcbcbcb),
      ),
    ),
  );

  String getSybmol(String carTip) {
    switch (carTip) {
      case "5":
        return "NKR";
      case "6":
        return "NPR";
      case "8":
        return "NQR";
      case "700p":
        return "NMR";
      default:
        return "";
    }
  }

  double getFullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getFullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double getLargefontSizeByScreen() {
    var size = ProfileService().getDeviceDimension();

    if (size <= 270000.0) {
      return slargefontSize;
    } else if (size <= 350000.0) {
      return mlargefontSize;
    } else {
      return llargefontSize;
    }
  }

  double getTitlefontSizeByScreen() {
    var size = ProfileService().getDeviceDimension();

    if (size <= 270000.0) {
      return stitlefontSize;
    } else if (size <= 350000.0) {
      return mtitlefontSize;
    } else {
      return ltitlefontSize;
    }
  }

  double getSubTitlefontSizeByScreen() {
    var size = ProfileService().getDeviceDimension();

    if (size <= 270000.0) {
      return ssubTitlefontSize;
    } else if (size <= 350000.0) {
      return msubTitlefontSize;
    } else {
      return lsubTitlefontSize;
    }
  }

  double getTextfontSizeByScreen() {
    var size = ProfileService().getDeviceDimension();

    if (size <= 270000.0) {
      return stextfontSize;
    } else if (size <= 350000.0) {
      return mtextfontSize;
    } else {
      return ltextfontSize;
    }
  }

  double getSmallfontSizeByScreen() {
    var size = ProfileService().getDeviceDimension();

    if (size <= 270000.0) {
      return ssmallTextfontSize;
    } else if (size <= 350000.0) {
      return msmallTextfontSize;
    } else {
      return lsmallTextfontSize;
    }
  }

  String getCleanedTitleText(String text, int length) {
    try {
      var words = text.split(" ").toList();

      if (words.length <= 1) words = text.split("_");

      String result = "";

      for (int i = 0; i < words.length; i++) {
        result += " " + words[i];

        if (i + 1 < words.length &&
            result.length + words[i + 1].length > length) {
          result += " ...";
          break;
        }
      }

      return result;
    } catch (e) {}
    return "";
  }}