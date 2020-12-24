import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:register/ApiModels/Activity.dart';
import 'package:register/Business/RegisterBusiness.dart';

class DropDownActivity extends StatefulWidget {
  List<Activity> selectedCheckBoxItems1 = List<Activity>();
  bool checkboxVal = false;
  bool checkboxVal2 = false;
  Function(bool checkboxVal, bool checkboxVal2,
      List<Activity> selectedCheckBoxItems1) onActivityCallBack;

  DropDownActivity({
    this.selectedCheckBoxItems1,
    this.checkboxVal,
    this.checkboxVal2,
    this.onActivityCallBack,
  });

  @override
  _DropDownActivityState createState() => _DropDownActivityState();
}

class _DropDownActivityState extends State<DropDownActivity> {
  String dropdownValue8;

  void setSelectedCheckBox1(Activity _b, bool _c) {
    if (_c) {
      var index = widget.selectedCheckBoxItems1
          .indexWhere((element) => element.name == _b.name);
      if (index < 0) {
        widget.selectedCheckBoxItems1.add(_b);
      }
    } else {
      var index = widget.selectedCheckBoxItems1
          .indexWhere((element) => element.name == _b.name);
      if (index >= 0) {
        widget.selectedCheckBoxItems1.removeAt(index);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Text(
              'نوع فعالیت',
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
          Container(
            //width: MediaQuery.of(context).size.width / 1.9,
            // height: 50.0,
            child: Stack(
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    onChanged: (value) {},
                    value: dropdownValue8,
                    icon: Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: SvgPicture.string(_svg_m7ofv4),
                    ),
                    iconSize: 24,
                    elevation: 8,
                    items: RegisterBusiness.activity == null
                        ? List<DropdownMenuItem<String>>()
                        : RegisterBusiness.activity
                            .map(
                              (e) => DropdownMenuItem(
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  // height: 11.0,
                                  child: StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter setState) {
                                    return CheckboxListTile(
                                      // contentPadding: EdgeInsets.all(10),
                                      activeColor: Color(0xFFeb5151),
                                      title: Text(
                                        e.name,
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                25),
                                      ),
                                      value: widget.selectedCheckBoxItems1
                                                  .indexWhere((element) =>
                                                      element.name == e.name) >=
                                              0
                                          ? true
                                          : false,
                                      onChanged: (value) {
                                        setSelectedCheckBox1(e, value);
                                        if (e.name == 'وارد کننده') {
                                          if (widget.checkboxVal == true) {
                                            widget.checkboxVal = false;
                                          } else {
                                            widget.checkboxVal = true;
                                          }
                                        }
                                        if (e.name == 'تولید کننده') {
                                          if (widget.checkboxVal2 == true) {
                                            widget.checkboxVal2 = false;
                                          } else {
                                            widget.checkboxVal2 = true;
                                          }
                                        }
                                        setState(() {});
                                        widget.onActivityCallBack(
                                            widget.checkboxVal,
                                            widget.checkboxVal2,
                                            widget.selectedCheckBoxItems1);
                                      },
                                    );
                                  }),
                                ),
                              ),
                            )
                            .toList(),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 15,
                  width: MediaQuery.of(context).size.width / 2,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_m7ofv4 =
    '<svg viewBox="8.3 20.0 13.4 9.0" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 21.66, 29.0)" d="M 5.901299953460693 1.076775193214417 C 6.301180839538574 0.5398858189582825 7.105405807495117 0.5398857593536377 7.505286693572998 1.076775074005127 L 12.21687698364258 7.402667045593262 C 12.70819091796875 8.062315940856934 12.23739624023438 9 11.41488361358643 9 L 1.991703510284424 9 C 1.169191122055054 9.000000953674316 0.6983963847160339 8.062315940856934 1.189710140228271 7.402667045593262 Z" fill="#eb5151" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
