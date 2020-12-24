import 'package:flutter/material.dart';
import 'package:register/ApiModels/Brand.dart';

class DropdownImportedBrand extends StatefulWidget {
  List<Brand> selectedItems = List<Brand>();
  Function(String newVal) onImportedBrandCallBack;


  DropdownImportedBrand({this.selectedItems , this.onImportedBrandCallBack});

  @override
  _DropdownImportedBrandState createState() => _DropdownImportedBrandState();
}

class _DropdownImportedBrandState extends State<DropdownImportedBrand> {
  String dropdownValue5;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 38,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.only(right: 10.0),
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
              'برند وارداتی',
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2.2,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: dropdownValue5,
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).textTheme.bodyText1.color,
                    fontFamily: 'IRANSans'),
                icon: Row(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 5.0),
                    //   child: SvgPicture.string(_svg_m7ofv4),
                    // ),
                  ],
                ),
                iconSize: 24,
                elevation: 16,
                onChanged: (String newValue) {
                  widget.onImportedBrandCallBack(newValue);
                  setState(() {
                    dropdownValue5 = newValue;
                  });
                },
                items: widget.selectedItems
                    .where((element) => element.typeBrandId == 2)
                    .map((e) => e.persianName)
                    .toList()
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
