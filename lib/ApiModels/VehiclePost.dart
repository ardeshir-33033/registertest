import 'package:register/ApiModels/TypeVehicle.dart';

import 'TypeBrand.dart';

class VehiclePost {
  int vehicleId;

  VehiclePost({this.vehicleId});

  VehiclePost.fromJson(Map<String, dynamic> json) {
    vehicleId = json['vehicleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vehicleId != null) data['vehicleId'] = this.vehicleId;
    return data;
  }

  List<VehiclePost> listFromJson(dynamic jsns) {
    if (jsns != null) {
      return jsns.map<VehiclePost>((ct) {
        return VehiclePost.fromJson(ct);
      }).toList();
    }

    return null;
  }
}
