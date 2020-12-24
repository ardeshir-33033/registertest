import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:register/ApiModels/LocationOfRegister.dart';

class Animatedred extends StatefulWidget {
  List<LocationOfRegister> types;
  Function(LocationOfRegister result) OnSelectedCallback;

  Animatedred({
    this.types,
    this.OnSelectedCallback,
  });

  @override
  _AnimatedredState createState() => _AnimatedredState();
}

class _AnimatedredState extends State<Animatedred> {
  String selectTypes = "";
  Decoration userSelected = BoxDecoration(
      //shape: BoxShape.rectangle,
      //color: Colors.red,
      border: Border(
          bottom: BorderSide(
    color: Color(0xffeb5151),
    width: 3.0,
  )));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //selectTypes = widget.types != null ? widget.types.first.name : "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      //width: 800,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: widget.types
              .map((e) => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            selectTypes = e.name;
                            setState(() {});
                            if (widget.OnSelectedCallback != null) {
                              widget.OnSelectedCallback(e);
                            }
                          },
                          child: Container(
                            height: 38.0,
                            decoration: selectTypes == e.name
                                ? userSelected
                                : BoxDecoration(),
                            child: Text(e.name),
                          ),
                        ),
                      ]))
              .toList(),
        )
      ),
    );
  }
}
