import 'ContactModel.dart';

class UserMicroModel {
  String fullName;
  int id;
  String nikName;
  List<ContactModel> contacts;
  String userType;

  UserMicroModel({
    this.fullName,
    this.id,
    this.userType,
    this.contacts,
    this.nikName,
  });

  UserMicroModel fromJson(dynamic jsn) {
    this.fullName = jsn["fullName"] ?? "";
    this.id = int.parse(jsn["id"] != null ? jsn["id"].toString() : "0") ?? 0;
    this.nikName = jsn["nikName"] ?? "";
    this.userType = jsn["userType"] ?? "";
    this.contacts = ContactModel().listFromJson(jsn["contacts"]);

    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (fullName != null) data['fullName'] = this.fullName;
    if (nikName != null) data['nikName'] = nikName;
    if (id != null) data['id'] = id;
    if (userType != null) data['userType'] = userType;
    if (contacts != null)
      data['contacts'] =
      contacts != null ? ContactModel().listToJson(contacts) : null;

    return data;
  }
}
