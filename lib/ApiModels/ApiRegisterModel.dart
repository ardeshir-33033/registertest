import 'package:register/ApiModels/BrandPost.dart';
import 'package:register/ApiModels/BrandToRegister.dart';
import 'package:register/ApiModels/MalToRegister.dart';
import 'package:register/ApiModels/MallPost.dart';
import 'package:register/ApiModels/VehiclePost.dart';

import 'Brand.dart';
import 'Mall.dart';
import 'UserActivity.dart';
import 'Vehicle.dart';

class ApiRegisterModel {
  int locationOfRegisterId;
  List<BrandToRegister> brands;
  List<VehiclePost> vehicles;
  String fName;
  String lName;
  String nameOFMall;
  int floorOfMall;
  String noOfMall;
  String nameOFShop;
  String manufactureName;
  String manufactureHistory;
  double locationLat;
  double locationLng;
  List<UserActivity> activites;
  List<MallPost> malls;
  int id;

  ApiRegisterModel(
      {this.locationOfRegisterId,
      this.malls,
      this.brands,
      this.vehicles,
      this.id,
      this.fName,
      this.lName,
      this.nameOFMall,
      this.floorOfMall,
      this.noOfMall,
      this.manufactureHistory,
      this.manufactureName,
      this.nameOFShop,
      this.locationLat,
      this.locationLng,
      this.activites});

  ApiRegisterModel.fromJson(Map<String, dynamic> json) {
    locationOfRegisterId = json['locationOfRegisterId'];
    if (json['brands'] != null) {
      brands = new List<BrandToRegister>();
      json['brands'].forEach((v) {
        brands.add(new BrandToRegister.fromJson(v));
      });
    }
    if (json['malls'] != null) {
      malls = new List<MallPost>();
      json['malls'].forEach((v) {
        malls.add(new MallPost.fromJson(v));
      });
    }
    if (json['vehicles'] != null) {
      vehicles = new List<VehiclePost>();
      json['vehicles'].forEach((v) {
        vehicles.add(new VehiclePost.fromJson(v));
      });
    }

    fName = json['fName'];
    lName = json['lName'];
    nameOFMall = json['nameOFMall'];
    floorOfMall = json['floorOfMall'];
    manufactureHistory = json['manufactureHistory'];
    manufactureName = json['manufactureName'];
    noOfMall = json['noOfMall'];
    nameOFShop = json['nameOFShop'];
    id = json['id'];
    locationLat = json['locationLat'];
    locationLng = json['locationLng'];
    if (json['activites'] != null) {
      activites = new List<UserActivity>();
      json['activites'].forEach((v) {
        activites.add(new UserActivity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.locationOfRegisterId != null)
      data['locationOfRegisterId'] = this.locationOfRegisterId;
    if (this.brands != null) {
      data['brands'] = this.brands.map((v) => v.toJson()).toList();
    }
    if (this.vehicles != null) {
      data['vehicles'] = this.vehicles.map((v) => v.toJson()).toList();
    }
    if (this.fName != null) data['fName'] = this.fName;
    if (this.id != null) data['id'] = this.id;
    if (this.lName != null) data['lName'] = this.lName;
    if (this.nameOFMall != null) data['nameOFMall'] = this.nameOFMall;
    if (this.floorOfMall != null) data['floorOfMall'] = this.floorOfMall;
    if (this.manufactureHistory != null)
      data['manufactureHistory'] = this.manufactureHistory;
    if (this.manufactureName != null)
      data['manufactureName'] = this.manufactureName;
    if (this.noOfMall != null) data['noOfMall'] = this.noOfMall;
    if (this.nameOFShop != null) data['nameOFShop'] = this.nameOFShop;
    if (this.locationLat != null) data['locationLat'] = this.locationLat;
    if (this.locationLng != null) data['locationLng'] = this.locationLng;
    if (this.activites != null) {
      data['activites'] = this.activites.map((v) => v.toJson()).toList();
    }
    return data;
  }

  List<ApiRegisterModel> listFromJson(dynamic jsns) {
    if (jsns != null) {
      return jsns.map<ApiRegisterModel>((ct) {
        return ApiRegisterModel.fromJson(ct);
      }).toList();
    }

    return null;
  }
}
