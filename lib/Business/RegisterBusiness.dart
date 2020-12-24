import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:register/ApiModels/Activity.dart';
import 'package:register/ApiModels/ApiRegisterModel.dart';
import 'package:register/ApiModels/Brand.dart';
import 'package:register/ApiModels/InitialModel.dart';
import 'package:register/ApiModels/LocationOfRegister.dart';
import 'package:register/ApiModels/MalToRegister.dart';
import 'package:register/ApiModels/Mall.dart';
import 'package:register/ApiModels/TypeBrand.dart';
import 'package:register/ApiModels/TypeVehicle.dart';
import 'package:register/ApiModels/Vehicle.dart';
import 'package:register/Business/ProfileService.dart';
import 'package:register/Models/ActivityDetail.dart';
import 'package:register/Models/Response.dart';
import 'package:register/Service/EndPointService.dart';
import 'package:flinq/flinq.dart';
import 'package:path/path.dart' as path1;

class RegisterBusiness with ChangeNotifier {
  static List<LocationOfRegister> locations;
  static List<Brand> brands;
  static List<Brand> importBrands;
  static List<Brand> personalBrands;
  static List<TypeVehicle> carTypes;
  static List<TypeBrand> types;
  static List<Activity> activity;
 // static List<ActivityDetail> proActivity;
  static List<Vehicle> vehicles;
  static List<String> pictures;
  static List<Mall> malls;
  static String audioFile;
  static LocationOfRegister selectedLocation;

  Future<InitialModel> initialDataAsync() async {
    ResponseModel response = await EndPointService()
        .setupApi("Registeration", "InitParameters", []).httpXGet(
      EndPointService().getBearerHeader(ProfileService().getToken()),
      ResponseEnum.ResponseModelEnum,
    );

    if (response.isSuccess) {
      InitialModel result = InitialModel.fromJson(response.data);

      brands = result.brands.toList();

      if (brands != null && brands.length > 0) {
        importBrands =
            brands.where((element) => element.typeBrandId == 2).toList();

        personalBrands =
            brands.where((element) => element.typeBrandId != null).toList();
      }

      carTypes = result.vehicles.map((e) => e.vehicleType).toList();
      var groupedTypes = List<TypeVehicle>();
      carTypes.group((item) => item.name).forEach((key, value) {
        if (value != null && value.length > 0) {
          groupedTypes.add(value.first);
        }
      });
      carTypes = groupedTypes;
      // carTypes = carTypes.distinct;

      vehicles = result.vehicles.map((e) => e).toList();
      var groupedVehicles = List<Vehicle>();
      vehicles.group((item) => item.name).forEach((key, value) {
        if (value != null && value.length > 0) {
          groupedVehicles.add(value.first);
        }
      });
      //vehicles = vehicles.distinct;

      types = result.typeBrands.map((e) => e).toList();
      var groupedBrandTypes = List<TypeBrand>();
      types.group((item) => item.name).forEach((key, value) {
        if (value != null && value.length > 0) {
          groupedBrandTypes.add(value.first);
        }
      });
      //types = types.distinct;

      //activity = result.;
      activity = result.activites.map((e) => e).toList();
      var groupedActivity = List<Activity>();
      activity.group((item) => item.name).forEach((key, value) {
        if(value!=null && value.length> 0){
         groupedActivity.add(value.first);
        }
      });

      // proActivity = result.
      //
      malls = result.malls.map((e) => e).toList();
      var groupedMall = List<Mall>();
      malls.group((item) => item.mallName).forEach((key, value) {
        if(value != null && value.length>0){
          groupedMall.add(value.first);
        }
      });

      locations = result.locationOfRegisters.map((e) => e).toList();
      var groupedLocations = List<LocationOfRegister>();
      locations.group((item) => item.name).forEach((key, value) {
        if (value != null && value.length > 0) {
          groupedLocations.add(value.first);
        }
      });
      //locations = locations.distinct;

      return result;
    }

    return null;
  }

  Future<ApiRegisterModel> RegisterAsync(ApiRegisterModel model) async {
    var json = jsonEncode(model.toJson());

    ResponseModel response =
        await EndPointService().setupApi("Registeration", "", []).httpXPost(
      json,
      EndPointService().getBearerHeader(ProfileService().getToken()),
      ResponseEnum.ResponseModelEnum,
    );

    if (response.isSuccess) {
      var data = ApiRegisterModel.fromJson(response.data);

      if (data != null) {
        return data;
      }
    }

    return null;
  }

  Future<MallToRegister> RegisterMallAsync(MallToRegister model) async {
    var json = jsonEncode(model.toJson());

    ResponseModel response =
    await EndPointService().setupApi("Registeration", "setMall", []).httpXPost(
      json,
      EndPointService().getBearerHeader(ProfileService().getToken()),
      ResponseEnum.ResponseModelEnum,
    );

    if (response.isSuccess) {
      var data = MallToRegister.fromJson(response.data);

      if (data != null) {
        return data;
      }
    }

    return null;
  }

  Future<ResponseModel> uploadImage(File data, int id) async {
    try {
      Dio dio = new Dio();

      var fd = FormData.fromMap({
        "model": await MultipartFile.fromFile(
          data.path,
          filename: path1.basename(data.path),
        ),
      });
      String url =
          "https://registration.dinavision.org/api/v1/Registeration?id=" +
              id.toString();
      var response = await dio.put(
        url,
        data: fd,
        options: Options(
          headers: EndPointService().getUploadBearerHeader(
            ProfileService().getToken(),
          ),
        ),
      );
      if (response.data != null) {
        return ResponseModel().fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }

    return ResponseModel(
      isSuccess: false,
    );
  }

  Future<ResponseModel> uploadVoice(File data, int id) async {
    try {
      Dio dio = new Dio();

      var fd = FormData.fromMap({
        "model": await MultipartFile.fromFile(
          data.path,
          filename: path1.basename(data.path),
        ),
      });
      String url =
          "https://registration.dinavision.org/api/v1/Registeration?id=" +
              id.toString();
      var response = await dio.put(
        url,
        data: fd,
        options: Options(
          headers: EndPointService().getUploadBearerHeader(
            ProfileService().getToken(),
          ),
        ),
      );

      if (response.data != null) {
        return ResponseModel().fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }

    return ResponseModel(
      isSuccess: false,
    );
  }

  void setNewPicture(String path) {
    if (pictures == null) pictures = List<String>();
    if (path.isNotEmpty) pictures.add(path);
  }

  void setAudioFile(String _file) {
    audioFile = _file;
  }

  void setNewPictures(List<String> _paths) {
    pictures = _paths;
  }

  void removePicture(String path) {
    pictures = pictures.where((element) => element != path).toList();
  }

  List<TypeBrand> getBrandTypes() {
    return types ?? List<TypeBrand>();
  }

  List<Activity> getActivity(){
    return activity ?? List<Activity>();
  }

  List<TypeVehicle> getVehicleTypes() {
    return carTypes ?? List<TypeVehicle>();
  }

  List<LocationOfRegister> getLocations() {
    return locations ?? List<LocationOfRegister>();
  }

  List<Mall> getMalls(){
    return malls ?? List<Mall>();
  }

  List<Brand> getBrands() {
    return brands ?? List<Brand>();
  }

  List<Brand> getImportBrands() {
    return importBrands ?? List<Brand>();
  }

  List<Brand> getPersonalBrands() {
    return personalBrands ?? List<Brand>();
  }

  List<Vehicle> getVehicles() {
    return vehicles ?? List<Vehicle>();
  }

  List<String> getPictures() {
    return pictures ?? List<String>();
  }

  String getAudioFile() {
    return audioFile ?? "";
  }

  void setSelectedLocation(LocationOfRegister loc){
    selectedLocation = loc;
  }

  LocationOfRegister getSelectedLocation(){
    return selectedLocation;
  }
}
