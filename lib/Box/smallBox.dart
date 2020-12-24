import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:register/ApiModels/Brand.dart';
import 'package:register/Models/BrandModel.dart';

class SmallBox extends StatefulWidget {
  Function(Brand result) OnAddCallback;
  bool personal;

  SmallBox({
    @required this.OnAddCallback,
    @required this.personal,
  });

  @override
  _SmallBoxState createState() => _SmallBoxState();
}

class _SmallBoxState extends State<SmallBox> {
  String LatinName;

  String FarsiName;

  String Country;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [Center(child: Text('ساخت برند جدید'))],
                ),
                Container(
                  width: 100,
                  child: TextField(
                    cursorColor: Colors.grey,
                    cursorRadius: Radius.circular(5),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'نام لاتین',
                    ),
                    onChanged: (String value) {
                      LatinName = value;
                    },
                  ),
                ),
                Divider(
                  height: 1.0,
                  thickness: 1.0,
                ),
                Container(
                  width: 100,
                  padding: EdgeInsets.all(5.0),
                  child: TextField(
                    cursorColor: Colors.grey,
                    cursorRadius: Radius.circular(5),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'نام فارسی',
                    ),
                    onChanged: (String value) {
                      FarsiName = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Divider(
                    height: 1.0,
                    thickness: 1.0,
                  ),
                ),
                Container(
                  width: 100,
                  padding: EdgeInsets.all(5.0),
                  child: TextField(
                    cursorColor: Colors.grey,
                    cursorRadius: Radius.circular(5),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'نام کشور',
                    ),
                    onChanged: (String value) {
                      Country = value;
                    },
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.red)),
                color: Color(0xffeb5151),
                onPressed: () {
                  if (widget.OnAddCallback != null) {
                    widget.OnAddCallback(Brand(
                      persianName: FarsiName,
                      englishName: LatinName,
                      typeBrandId: widget.personal != null
                          ? widget.personal
                              ? 3
                              : 2
                          : 3,
                      madeInContry: Country,
                    ));
                    Navigator.pop(context);
                  }
                },
                textColor: Colors.white,
                child: Text(
                  "ثبت",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BrandBuild extends StatefulWidget {
  int index;

  BrandBuild({this.index});

  @override
  _BrandBuildState createState() => _BrandBuildState();
}

class _BrandBuildState extends State<BrandBuild> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Text(BrandList[widget.index].LatinName),
        Text(SelectedBrand[widget.index].FarsiName),
        //Text(BrandList[widget.index].Country),
      ],
    );
  }
}
