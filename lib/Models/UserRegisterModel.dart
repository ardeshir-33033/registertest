import 'RegisterContactModel.dart';

class UserRegisterModel {
  String fullName;
  String password;
  int age = 25;
  String gender = "Male";
  int id;
  String userName;
  String email;
  String nikName;
  String phoneNumber;
  String userType;
  List<RegisterContactModel> contacts;

  UserRegisterModel({
    this.fullName,
    this.password,
    this.age,
    this.email,
    this.gender,
    this.id,
    this.userName,
    this.contacts,
    this.nikName,
    this.phoneNumber,
    this.userType,
  });

  UserRegisterModel fromJson(dynamic jsn) {
    this.fullName = jsn["fullName"] ?? "";
    this.phoneNumber = jsn["phoneNumber"] ?? "";
    this.password = jsn["password"] ?? "";
    this.age = int.parse(jsn["age"]?.toString()) ?? 25;
    this.email = jsn["email"] ?? "";
    this.gender = jsn["gender"].toString() == "Male" ? "Male" : "Female";
    this.id = int.parse(jsn["id"] != null ? jsn["id"].toString() : "0") ?? 0;
    this.userName = jsn["userName"] ?? "";
    this.nikName = jsn["nikName"] ?? "";
    this.userType = jsn["userType"]?? "";
    this.contacts = RegisterContactModel().listFromJson(jsn["contacts"]);

    return this;
  }

  Map<String, dynamic> toJson() => {
    'fullName': fullName,
    'nikName': nikName,
    'phoneNumber': phoneNumber,
    'password': password,
    'age': age,
    'email': email,
    'gender': gender,
    'id': id,
    'userName': userName,
    'userType': userType,
    'contacts': contacts != null
        ? RegisterContactModel().listToJson(contacts)
        : null
  };
}
