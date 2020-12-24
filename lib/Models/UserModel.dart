import 'ContactModel.dart';

class UserModel {
  String fullName;
  String password;
  int age = 25;
  int gender = 1;
  bool isActive;
  int id;
  String userName;
  String email;
  String avatar;
  String nikName;
  String phoneNumber;
  List<ContactModel> contacts;
  String userType;

  UserModel(
      {this.fullName,
        this.password,
        this.age,
        this.email,
        this.gender,
        this.id,
        this.userName,
        this.avatar,
        this.isActive,
        this.userType,
        this.contacts,
        this.nikName,
        this.phoneNumber,});

  UserModel fromJson(dynamic jsn) {
    this.fullName = jsn["fullName"] ?? "";
    this.phoneNumber = jsn["phoneNumber"] ?? "";
    this.password = jsn["password"] ?? "";
    this.age = int.parse(jsn["age"]?.toString()) ?? 25;
    this.email = jsn["email"] ?? "";
    this.gender = jsn["gender"].toString() == "Male" ? 1 : 0;
    this.id = int.parse(jsn["id"] != null ? jsn["id"].toString() : "0") ?? 0;
    this.userName = jsn["userName"] ?? "";
    this.avatar = jsn["avatar"] ?? "";
    this.nikName = jsn["nikName"] ?? "";
    this.userType = jsn["userType"] ?? "";
    this.isActive = jsn["isActive"] ?? false;
    this.contacts = ContactModel().listFromJson(jsn["contacts"]);

    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (fullName != null) data['fullName'] = this.fullName;
    if (nikName != null) data['nikName'] = nikName;
    if (phoneNumber != null) data['phoneNumber'] = phoneNumber;
    if (password != null) data['password'] = password;
    if (age != null) data['age'] = age;
    if (email != null) data['email'] = email;
    if (gender != null) data['gender'] = gender;
    if (id != null) data['id'] = id;
    if (userName != null) data['userName'] = userName;
    if (userType != null) data['userType'] = userType;
    if (avatar != null) data['avatar'] = avatar;
    if (isActive != null) data['isActive'] = isActive;
    if (contacts != null)
      data['contacts'] =
      contacts != null ? ContactModel().listToJson(contacts) : null;

    return data;
  }
}
