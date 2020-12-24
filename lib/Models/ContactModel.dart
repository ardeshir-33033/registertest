
import 'ContactTypeVM.dart';

class ContactModel {
  String value;
  String contactTypeId;
  ContactTypeVM contactType;
  int id;

  ContactModel({
    this.value,
    this.contactTypeId,
    this.id = 0,
  });

  ContactModel fromJson(dynamic jsn) {
    this.value = jsn["value"];
    this.contactTypeId = jsn["contactType_Id"];
    this.id = int.parse(jsn["id"].toString());
    if (jsn["contactType"] != null)
      this.contactType = ContactTypeVM.fromJson(jsn["contactType"]);

    return this;
  }

  List<ContactModel> listFromJson(dynamic jsn) {
    if (jsn != null) {
      return jsn.map<ContactModel>((ct) {
        return ContactModel().fromJson(ct);
      }).toList();
    }

    return null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.value != null) data['value'] = this.value;
    if (this.contactTypeId != null) data['contactType_Id'] = this.contactTypeId;
    if (this.id != null) data['id'] = this.id;
    if (this.contactType != null)
      data["contactType"] = this.contactType.toJson();

    return data;
  }

  dynamic listToJson(List<ContactModel> list) {
    List<Map> items = List<Map>();
    if (list != null) {
      for (var item in list) {
        items.add(item.toJson());
      }
    }

    return items;
  }
}
