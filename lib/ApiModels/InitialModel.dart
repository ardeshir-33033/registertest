import 'package:register/ApiModels/Activity.dart';
import 'package:register/Models/ActivityDetail.dart';

import 'Brand.dart';
import 'LocationOfRegister.dart';
import 'Mall.dart';
import 'TypeBrand.dart';
import 'Vehicle.dart';

class InitialModel {
  List<Brand> brands;
  List<LocationOfRegister> locationOfRegisters;
  List<Vehicle> vehicles;
  List<TypeBrand> typeBrands;
  List<Activity> activites;
  // List<ActivityDetail> detail;
  List<Mall> malls;

  InitialModel({this.brands, this.locationOfRegisters , this.malls
  //  , this.detail
  });

  InitialModel.fromJson(Map<String, dynamic> json) {
    if (json['brands'] != null) {
      brands = new List<Brand>();
      json['brands'].forEach((v) {
        brands.add(new Brand.fromJson(v));
      });
    }
    if(json['malls'] != null){
      malls = new List<Mall>();
      json['malls'].forEach((v){
        malls.add(new Mall.fromJson(v));
      });
    }


    if (json['locationOfRegisters'] != null) {
      locationOfRegisters = new List<LocationOfRegister>();
      json['locationOfRegisters'].forEach((v) {
        locationOfRegisters.add(new LocationOfRegister.fromJson(v));
      });
    }

    if (json['vehicles'] != null) {
      vehicles = new List<Vehicle>();
      json['vehicles'].forEach((v) {
        vehicles.add(new Vehicle.fromJson(v));
      });
    }
    if (json['typeBrands'] != null) {
      typeBrands = new List<TypeBrand>();
      json['typeBrands'].forEach((v) {
        typeBrands.add(new TypeBrand.fromJson(v));
      });
    }
    if(json['activites'] != null){
      activites = new List<Activity>();
      json['activites'].forEach((v){
        activites.add(new Activity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.brands != null) {
      data['brands'] = this.brands.map((v) => v.toJson()).toList();
    }
    if (this.locationOfRegisters != null) {
      data['locationOfRegisters'] =
          this.locationOfRegisters.map((v) => v.toJson()).toList();
    }

    if (this.vehicles != null) {
      data['vehicles'] = this.vehicles.map((v) => v.toJson()).toList();
    }
    if (this.typeBrands != null) {
      data['typeBrands'] = this.typeBrands.map((v) => v.toJson()).toList();
    }
    if(this.activites != null){
      data['activites'] = this.activites.map((e) => e.toJson()).toList();
    }
    if(this.malls != null){
      data['malls'] = this.malls.map((e) => e.toJson()).toList();
    }
    return data;
  }

  List<InitialModel> listFromJson(dynamic jsns) {
    if (jsns != null) {
      return jsns.map<InitialModel>((ct) {
        return InitialModel.fromJson(ct);
      }).toList();
      //return jsns.map((data) => CategoryVM().fromJson(data)).toList();
    }

    return null;
  }
}
