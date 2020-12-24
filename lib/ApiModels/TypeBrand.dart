class TypeBrand {
  String name;
  int id;

  TypeBrand({this.name, this.id});

  TypeBrand.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) data['name'] = this.name;
    if (this.id != null) data['id'] = this.id;
    return data;
  }

  List<TypeBrand> listFromJson(dynamic jsns) {
    if (jsns != null) {
      return jsns.map<TypeBrand>((ct) {
        return TypeBrand.fromJson(ct);
      }).toList();
    }

    return null;
  }
}
