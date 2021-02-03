import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:register/Models/AuthModel.dart';
import 'package:register/Models/GoogleAuth.dart';
import 'package:register/Models/JWT.dart';
import 'package:register/Models/LoginModel.dart';
import 'package:register/Models/QueryModel.dart';
import 'package:register/Models/Response.dart';
import 'package:register/Models/UserModel.dart';
import 'package:register/Models/UserRegisterModel.dart';
import 'package:register/Provider/ProviderServices.dart';
import 'package:register/Provider/TokenProvider.dart';
import 'package:register/Service/EndPointService.dart';
import 'package:register/Service/PathSerivce.dart';

class ProfileService with ChangeNotifier {
  // consts
  static const String userKey = "user-data";
  static const String jwtKey = "jwt-data";
  static const String userTypeKey = "type-data";
  static const String displayModeKey = "display-data";
  static const String displayPointKey = "point-data";
  static const String autoLoginKey = "auto-login-data";
  static const String myCarKey = "my-car";
  static double deviceWidth = 0.0;
  static double deviceHeight = 0.0;
  static UserModel userData;
  static UserModel user;

  //static String searchText = "ایسوزو";

  // models
  static JwtModel jwt;
  static bool displayPoint = false;
  static bool logedIn;
  static bool mechanicPanelOpened = false;
  static String autoLoginValue;
  static String displayMode = "grid";
  static String userType;
  static int selectedNavIndex = 0;

  // widgets
  static Widget profileIconWidget;
  static Widget avatarWidget;
  static Widget mechanicPointPanel;

  // device
  setDeviceDimension(double w, double h) {
    deviceHeight = h;
    deviceWidth = w;
  }

  getDeviceDimension() {
    return deviceHeight * deviceWidth;
  }

  UserModel getUserData() {
    return user ?? UserModel();
  }

  // String getSearchedText() {
  //   return searchText;
  // }

  // String setSearchedText(String text) {
  //   searchText = text;
  // }

  // callbacks
  static Function(dynamic result) refreshCallback;
  static Function(dynamic result) displayModeChangeCallback;

  // resources
  static TextEditingController passwordController = TextEditingController();
  static String profileIconSvg =
      '<svg viewBox="10.5 8.0 13.5 9.0" ><path transform="translate(10.49, 7.99)" d="M 0 4.504886150360107 C 0 4.504886150360107 4.503236293792725 8.999323844909668 4.504886150360107 9.009772300720215 C 4.50653600692749 9.020220756530762 13.51465797424316 0 13.51465797424316 0" fill="none" stroke="#8d4399" stroke-width="3" stroke-miterlimit="4" stroke-linecap="round" /></svg>';

// user model part

  bool autoLoginAllow() {
    if (autoLoginValue == null || autoLoginValue == "0") {
      return false;
    } else {
      return true;
    }
  }

  Future saveAutoLoginDataLocaly(bool al) async {
    await SharedPreferencePath()
        .setUserDataInSharePrefrences(al ? "1" : "0", autoLoginKey);
    autoLoginValue = al ? "1" : "0";
  }

  Future<String> loadAutoLoginDataLocaly() async {
    var data =
        await SharedPreferencePath().getUserDataInSharePrefrences(autoLoginKey);
    autoLoginValue = data ?? '';

    return autoLoginValue;
  }

  // bool autoLoginAllow() {
  //   if (autoLoginValue == null ||
  //       autoLoginValue == "0" ||
  //       autoLoginValue == "") {
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }
  Future<UserModel> autoLogin() {
    if (user != null && user.userName != null && user.password != null) {
      return ProfileService().login(
        LoginModel(
            grantType: "password",
            userName: user.userName,
            password: user.password),
      );
    } else {
      return ProfileService().login(
        LoginModel(grantType: "", userName: "", password: ""),
      );
    }
  }

  Future<UserModel> initialization() async {
    user = await loadUserDataLocaly();
    autoLoginValue = await loadAutoLoginDataLocaly();
  }

  Future<JwtModel> GoogleLogIn(GoogleAuth modelAuth) async {
    ResponseModel _responseData = await EndPointService()
        .setupApi("Users", "GoogleToken", null, "")
        .httpPost(
          jsonEncode(modelAuth.toJson()),
          HeaderEnum.BasicHeaderEnum,
          ResponseEnum.ResponseModelEnum,
        );
    if (_responseData.isSuccess) {
      jwt = JwtModel().fromJson(_responseData.data);

      TokenProvider().setToken(jwt.access_token);

      return jwt;
    }
  }

  GoogleAuth GoogleSignToPost(GoogleSignInAccount GoogleUser) {
    GoogleAuth googleAuthUser = GoogleAuth(
      id: GoogleUser.id,
      displayName: GoogleUser.displayName,
      photoUrl: GoogleUser.photoUrl,
      email: GoogleUser.email,
    );

    return googleAuthUser;
  }

  Future<UserModel> login(LoginModel model) async {
    model.grantType = "password";
    ResponseModel _responseData =
        await EndPointService().setupApi("Users", "Token", null, "").httpPost(
              model.toFormData(),
              HeaderEnum.EmptyHeaderEnum,
              ResponseEnum.ResponseModelEnum,
            );
    if (_responseData.isSuccess) {
      AuthModel auth = AuthModel().fromJson(_responseData.data);

      auth.user.userName = model.userName;
      auth.user.password = model.password;

      userData = auth.user;
      user = auth.user;
      saveUserDataLocaly(user);

      jwt = auth.jwt;

      TokenProvider().setToken(jwt.access_token);
      //saveJWTDataLocaly(jwt);
      //decodeUserType();

      return auth.user;
    } else {
      return null;
    }
  }

  Future saveUserDataLocaly(UserModel model) async {
    await SharedPreferencePath()
        .setUserDataInSharePrefrences(jsonEncode(model), userKey);
  }

  Future<UserModel> loadUserDataLocaly() async {
    String jsonString =
        await SharedPreferencePath().getUserDataInSharePrefrences(userKey);
    if (jsonString != null) {
      var json = jsonDecode(
          await SharedPreferencePath().getUserDataInSharePrefrences(userKey));

      user = UserModel().fromJson(json);

      return user;
    }
  }

  // Future<UserModel> autoLogin() {
  //   if (user != null && user.userName != null && user.password != null) {
  //     return login(
  //       LoginModel(
  //           grantType: "password",
  //           userName: user.userName,
  //           password: user.password),
  //     );
  //   }
  // }

  Future<UserRegisterModel> register(UserRegisterModel model) async {
    String jsn = jsonEncode(model);
    ResponseModel _responseData =
        await EndPointService().setupApi("Users", "", null, "").httpPost(
              jsn,
              HeaderEnum.BasicHeaderEnum,
              ResponseEnum.ResponseModelEnum,
            );

    if (_responseData.isSuccess) {
      return UserRegisterModel().fromJson(_responseData.data);
    }

    return null;
  }

  Future<bool> reset(UserModel model) async {
    ResponseModel _response = await EndPointService()
        .setupApi(
          "Users",
          "",
          [
            QueryModel(
              name: "userName",
              value: model.userName,
            ),
          ],
          "",
        )
        .httpDelete(
          HeaderEnum.EmptyHeaderEnum,
          ResponseEnum.ResponseModelEnum,
        );

    if (_response.isSuccess) {
      return true;
    }

    return false;
  }

  Future<bool> validation(String code, UserModel model) async {
    ResponseModel _responseData = await EndPointService()
        .setupApi(
          "Users",
          "ValidPhone",
          [
            QueryModel(
              name: "username",
              value: model.userName,
            ),
            QueryModel(
              name: "code",
              value: code,
            )
          ],
          "",
        )
        .httpPost(
          "",
          HeaderEnum.EmptyHeaderEnum,
          ResponseEnum.ResponseModelEnum,
        );

    if (_responseData.isSuccess) {
      return true;
    }

    return false;
  }

  Future resendSms(UserModel model) async {
    ResponseModel _response = await EndPointService()
        .setupApi(
          "Users",
          "AgainSendValidCode",
          [
            QueryModel(
              name: "username",
              value: model.userName,
            ),
          ],
          "",
        )
        .httpGet(
          HeaderEnum.EmptyHeaderEnum,
          ResponseEnum.ResponseModelEnum,
        );

    if (_response.isSuccess) {
      // method
    }
  }

  UserModel GetUserData() {
    return userData;
  }

  Future<UserModel> getUserByPhone(String phone) async {
    ResponseModel response = await EndPointService()
        .setupApi(
          "GetByPhoneNumber",
          "",
          [
            QueryModel(
              name: "phoneNumber",
              value: phone,
            ),
          ],
          "",
        )
        .httpGet(
          HeaderEnum.BasicHeaderEnum,
          ResponseEnum.ResponseModelEnum,
        );

    if (response.isSuccess) {
      UserModel _user = UserModel().fromJson(response.data);
      //profile = _user;
      return _user;
    }

    return null;
  }

  Future<ResponseModel> AddUserPhoneNumber(LoginPhone model) async {
    String modelString = '{ "phoneNumber": "${model.phoneNumber}" }';

    ResponseModel response = await EndPointService()
        .setupApi("Users", "SuspendedUser", [], "")
        .httpPost(
          modelString,
          HeaderEnum.BearerHeaderEnum,
          ResponseEnum.ResponseModelEnum,
        );
    return (response);
  }

  Future<ResponseModel> AddUserCode(String CodeText, String phoneNumber) async {
    String modelString =
        '{ "phoneNumber": "${phoneNumber}" , "code": "${CodeText}" }';

    ResponseModel response = await EndPointService()
        .setupApi("Users", "SuspendedUserVerify", [], "")
        .httpPost(
          modelString,
          HeaderEnum.BearerHeaderEnum,
          ResponseEnum.ResponseModelEnum,
        );
    return (response);
  }

  Future<void> AddnewUser(String phoneNumber, String Password) async {
    String modelString =
        '{ "phoneNumber": "${phoneNumber}" , "password": "${Password}" }';

    ResponseModel response = await EndPointService()
        .setupApi("Users", "CreateWithValidation", [], "")
        .httpPost(
          modelString,
          HeaderEnum.BearerHeaderEnum,
          ResponseEnum.ResponseModelEnum,
        );
    if (response.isSuccess) {
      print("yes");
    }
  }

  // Future<UserModel> getUserByUsername(String username) async {
  //   ResponseModel response = await EndPointService().setupApi(
  //     "Users",
  //     username,
  //     [],""
  //   ).httpXGet(
  //     HeaderEnum.BearerHeaderEnum,
  //     ResponseEnum.ResponseModelEnum,
  //   );
  //
  //   if (response.isSuccess) {
  //     UserModel _user = UserModel().fromJson(response.data);
  //     userData = _user;
  //     return _user;
  //   }
  //
  //   return null;
  // }

  String getToken() {
    return jwt?.access_token ?? "";
  }
}
