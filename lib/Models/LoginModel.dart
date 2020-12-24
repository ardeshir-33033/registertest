class LoginModel {
  String grantType;
  String userName;
  String password;

  LoginModel({
    this.grantType = "password",
    this.userName,
    this.password,
  });

  Map<String, dynamic> toFormData() => {
    "grant_type": grantType,
    "username": userName,
    "password": password,
  };

  LoginModel fromJson(dynamic jsn){
    this.grantType = jsn["grantType"].toString();
    this.userName = jsn["userName"].toString();
    this.password = jsn["password"].toString();

    return this;
  }
}
