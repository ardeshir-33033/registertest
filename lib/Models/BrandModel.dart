import 'package:flutter/material.dart';

class BrandModel {
  String LatinName;
  String FarsiName;
  String Country;
  Color color;

  BrandModel({
    this.LatinName,
    this.FarsiName,
    this.Country,
    TextStyle style,
    this.color,
  });
}

List<BrandModel> BrandList = [
  BrandModel(FarsiName: 'دایدو', color: Colors.grey.shade700),
  BrandModel(FarsiName: 'تایهو', color: Colors.grey.shade700),
  BrandModel(FarsiName: 'فوجی', color: Colors.grey.shade700)
];
List<BrandModel> SelectedBrand = [];
