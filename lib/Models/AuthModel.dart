import 'JWT.dart';
import 'UserModel.dart';

class AuthModel {
  JwtModel jwt;
  UserModel user;

  AuthModel({
    this.jwt,
    this.user,
  });

  AuthModel fromJson(dynamic jsn) {
    this.jwt = JwtModel().fromJson(jsn["jwt"]);
    this.user = UserModel().fromJson(jsn["user"]);

    return this;
  }

  Map<String, dynamic> toJson() => {
    'jwt': jwt.toJson(),
    'user': user.toJson(),
  };
}
