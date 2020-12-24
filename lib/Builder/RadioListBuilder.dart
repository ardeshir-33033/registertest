import 'package:flutter/material.dart';
import 'package:register/ApiModels/Brand.dart';
import 'package:register/Models/BrandModel.dart';

class RadioListBuilder extends StatefulWidget {
  List<Brand> list;
  Function(dynamic result1) AddCallback;

  RadioListBuilder({
    @required this.AddCallback,
    @required this.list,
  });

  @override
  _RadioListBuilderState createState() => _RadioListBuilderState();
}

class _RadioListBuilderState extends State<RadioListBuilder> {
  int checkedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              RadioListTile(
                title: Align(
                    alignment: Alignment(1.2, 0),
                    child: Text(
                      widget.list[index].persianName,
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    )),
                activeColor: Colors.black,
                value: index,
                groupValue: checkedValue,
                onChanged: (newValue) {
                  checkedValue = newValue;
                  SelectedBrand.add(
                      BrandModel(FarsiName: widget.list[index].persianName));
                  if (widget.AddCallback != null) {
                    widget.AddCallback(widget.list[index].persianName);
                  }
                },
              ),
              Divider(
                thickness: 1,
              )
            ],
          );
        },
        itemCount: widget.list.length,
      ),
    );
  }
}
