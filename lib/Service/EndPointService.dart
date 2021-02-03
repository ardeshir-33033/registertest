import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart' as path1;
import 'package:register/Business/RegisterBusiness.dart';
import 'package:register/CameraStuff/CameraMain.dart';
import 'package:register/Models/QueryModel.dart';
import 'package:register/Models/Response.dart';

var imagePreview;
var imagetest;

class EndPointService extends ApiService {
  @override
  String baseName = 'Users';

  @override
  String baseUrl = 'https://registration.dinavision.org/api/v1';
}

enum HeaderEnum {
  EmptyHeaderEnum,
  BasicHeaderEnum,
  FormDataHeaderEnum,
  BearerHeaderEnum,
  ImageHeaderEnum,
}

enum ResponseEnum {
  ResponseModelEnum,
  Unit8ListEnum,
}

abstract class ApiService {
  String baseUrlW = 'https://registration.dinavision.org/api/v1';
  List includes;
  String baseName;
  String baseUrl;
  String parameter = "";
  String query = "";
  String token = "";

  Object getBearerHeader(String _token) {
    return {
      "Authorization": 'Bearer ' + _token,
      "Accept": "application/json",
      "content-type": "application/json; charset=utf-8",
    };
  }

  Object getUploadBearerHeader(String _token) {
    return {
      "Authorization": 'Bearer ' + _token,
    };
  }

  Object formDataHeader = {
    "Accept": "multipart/form-data",
    "content-type": "application/json; charset=utf-8",
  };

  Object basicHeader = {
    "Accept": "application/json",
    "content-type": "application/json; charset=utf-8",
  };

  Object headerGetter(HeaderEnum typeEnum) {
    switch (typeEnum) {
      case HeaderEnum.ImageHeaderEnum:
        return ""; //imageHeader;
        break;
      case HeaderEnum.BearerHeaderEnum:
        return getBearerHeader(token); //bearerHeader;
        break;
      case HeaderEnum.FormDataHeaderEnum:
        return formDataHeader;
        break;
      case HeaderEnum.BasicHeaderEnum:
        return basicHeader;
        break;
      case HeaderEnum.EmptyHeaderEnum:
        return null;
        break;
      default:
        return basicHeader;
    }
  }

  responseGetter(ResponseEnum typeEnum, http.Response response) {
    switch (typeEnum) {
      case ResponseEnum.ResponseModelEnum:
        String data = utf8.decode(response.bodyBytes);

        if (data == null || data.isEmpty)
          return ResponseModel(
            statusCode: "555",
            isSuccess: false,
            data: null,
          );

        return ResponseModel().fromJson(
          jsonDecode(data),
        );
        break;
      case ResponseEnum.Unit8ListEnum:
        return response.bodyBytes;
        break;
      default:
        return response.bodyBytes;
    }
  }

  prepend() {
    return this.query == "" ? '?' : '&';
  }

  include(List includes) {
    this.query += "${this.prepend()}include=${includes.join(',')}";
    return this;
  }

  setupApi(String baseName, String parameter, List<QueryModel> queries, String _token) {
    this.baseName =
        baseName != null && baseName.isNotEmpty ? "/$baseName" : "/Users";
    this.parameter =
        parameter != null && parameter.isNotEmpty ? "/$parameter" : "";
    if (queries != null && queries.length > 0) {
      queries.forEach((element) {
        String nm = element.name;
        String vl = element.value;

        this.query += "${this.prepend()}$nm=$vl";
      });
    }

    token = _token;

    return this;
  }

  setBaseName(String name) {
    this.baseName = "/$name";
    return this;
  }

  setToken(String _token){
    token = _token;
  }

  addParameter(String parameter) {
    this.parameter = "/$parameter";
    return this;
  }

  addToQuery(String queryName, String value) {
    this.query += "${this.prepend()}$queryName=$value";
    return this;
  }

  addRangeToQuery(List<QueryModel> queries) {
    if (queries != null && queries.length > 0) {
      queries.forEach((element) {
        String nm = element.name;
        String vl = element.value;

        this.query += "${this.prepend()}$nm=$vl";
      });
    }

    return this;
  }

  httpGet(HeaderEnum headerType, ResponseEnum responseType) {
    return http
        .get(
          "$baseUrl$baseName$parameter$query",
          headers: headerGetter(headerType),
        )
        .then(
          (http.Response response) => responseGetter(
            responseType,
            response,
          ),
        );
  }

  httpXGet(HeaderEnum headerType, ResponseEnum responseType) {
    return http
        .get(
          "$baseUrl$baseName$parameter$query",
      headers: headerGetter(headerType),
        )
        .then(
          (http.Response response) => responseGetter(
            responseType,
            response,
          ),
        );
  }

  httpDelete(HeaderEnum headerType, ResponseEnum responseType) {
    return http
        .delete(
          "$baseUrl$baseName$parameter$query",
          headers: headerGetter(headerType),
        )
        .then(
          (http.Response response) => responseGetter(
            responseType,
            response,
          ),
        );
  }

  httpFind(id, HeaderEnum headerType, ResponseEnum responseType) {
    return http
        .get(
          "$baseUrl$baseName$parameter$query",
          headers: headerGetter(headerType),
        )
        .then(
          (http.Response response) => responseGetter(
            responseType,
            response,
          ),
        );
  }

  httpPost(
    var body,
    HeaderEnum headerType,
    ResponseEnum responseType,
  ) async {
    return http
        .post(
          "$baseUrl$baseName$parameter$query",
          headers: headerGetter(headerType),
          body: body,
        )
        .then(
          (http.Response response) => responseGetter(
            responseType,
            response,
          ),
        );
  }

  httpXPost(
    var body,
    dynamic _headers,
    ResponseEnum responseType,
  ) async {
    return http
        .post(
          "$baseUrl$baseName$parameter$query",
          headers: _headers,
          body: body,
        )
        .then(
          (http.Response response) => responseGetter(
            responseType,
            response,
          ),
        );
  }

  whttpPost(
    var body,
    HeaderEnum headerType,
    ResponseEnum responseType,
  ) async {
    return http
        .post(
          "$baseUrlW$baseName$parameter$query",
          headers: headerGetter(headerType),
          body: body,
        )
        .then(
          (http.Response response) => responseGetter(
            responseType,
            response,
          ),
        );
  }

  Future httpPut(
    var body,
    HeaderEnum headerType,
    ResponseEnum responseType,
  ) {
    return http
        .put(
          "$baseUrl$baseName$parameter$query",
          headers: headerGetter(headerType),
          body: body,
        )
        .then(
          (http.Response response) => responseGetter(
            responseType,
            response,
          ),
        );
  }

  httpPutFile({@required FormData body}) async {
    Dio dio = Dio();
    return dio
        .put("$baseUrl$baseName$parameter$query", data: body)
        .then((value) {
      return json.decode(value.data);
    });
  }

  Future<File> getImageFromGallery(int id, String property) async {
    //String url =
    //    "https://registration.dinavision.org/api/v1/Person/uploadImage";
    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1000,
      maxHeight: 1000,
      imageQuality: 70,
    );
    imagetest = image;
    imagePreview = image;
    RegisterBusiness().setNewPicture(image.path);
    //path.add(image.path);
    //print(path);

    //var result = await uploadImage(image, id);

    if (image != null) {
      return image;
    }

    return null;
  }

  Future<File> getImageFromCamera(int id, String property) async {
    String url =
        "https://registration.dinavision.org/api/v1/Person/uploadImage";

    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1000,
      maxHeight: 1000,
      imageQuality: 70,
    );
    imagetest = image;
    imagePreview = image;
    var result = await uploadImage(image, id);

    if (result != null) {
      return image;
    }

    return null;
  }

  Future<dynamic> uploadImage(File data, int id) async {
    try {
      Dio dio = new Dio();

      var fd = FormData.fromMap({
        "image": await MultipartFile.fromFile(
          data.path,
          filename: path1.basename(data.path),
        ),
        "id": id,
      });
      String url =
          "https://registration.dinavision.org/api/v1/Person/UploadImage";
      var response = await dio.post(url, data: fd);
      if (response != null) {
        return response;
      }
    } catch (e) {
      print(e);
    }

    return null;
  }

  Future<dynamic> uploadVoice(File data, int id) async {
    try {
      Dio dio = new Dio();

      var fd = FormData.fromMap({
        "voice": await MultipartFile.fromFile(
          data.path,
          filename: path1.basename(data.path),
        ),
        "id": id,
      });
      String url =
          "https://registration.dinavision.org/api/v1/Person/uploadvoice";
      var response = await dio.post(url, data: fd);

      if (response != null) {
        return response;
      }
    } catch (e) {
      print(e);
    }

    return null;
  }
}
