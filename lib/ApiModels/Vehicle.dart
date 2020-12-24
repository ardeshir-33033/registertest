import 'package:register/ApiModels/TypeVehicle.dart';

import 'TypeBrand.dart';

class Vehicle {
  String name;
  TypeVehicle vehicleType;
  int id;

  Vehicle({this.name, this.vehicleType, this.id});

  Vehicle.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    vehicleType = json['vehicleType'] != null
        ? new TypeVehicle.fromJson(json['vehicleType'])
        : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) data['name'] = this.name;
    if (this.vehicleType != null) {
      data['vehicleType'] = this.vehicleType.toJson();
    }
    if (this.id != null) data['id'] = this.id;
    return data;
  }

  List<Vehicle> listFromJson(dynamic jsns) {
    if (jsns != null) {
      return jsns.map<Vehicle>((ct) {
        return Vehicle.fromJson(ct);
      }).toList();
    }

    return null;
  }
}
