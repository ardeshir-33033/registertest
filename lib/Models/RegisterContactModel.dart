class RegisterContactModel {
  String value;
  String contactTypeId;
  int id;

  RegisterContactModel({
    this.value,
    this.contactTypeId,
    this.id = 0,
  });

  RegisterContactModel fromJson(dynamic jsn) {
    this.value = jsn["value"];
    this.contactTypeId = jsn["contactTypeId"];
    this.id = int.parse(jsn["id"].toString());

    return this;
  }

  List<RegisterContactModel> listFromJson(dynamic jsn) {
    if (jsn != null) {
      return jsn.map<RegisterContactModel>((ct) {
        return RegisterContactModel().fromJson(ct);
      }).toList();
    }

    return null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.value != null) data['value'] = this.value;
    if (this.contactTypeId != null) data['contactTypeId'] = this.contactTypeId;
    if (this.id != null) data['id'] = this.id;

    return data;
  }

  dynamic listToJson(List<RegisterContactModel> list) {
    List<Map> items = List<Map>();
    if (list != null) {
      for (var item in list) {
        items.add(item.toJson());
      }
    }

    return items;
  }
}
