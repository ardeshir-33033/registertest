class TypeVehicle {
  String name;
  int id;

  TypeVehicle({this.name, this.id});

  TypeVehicle.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) data['name'] = this.name;
    if (this.id != null) data['id'] = this.id;
    return data;
  }

  List<TypeVehicle> listFromJson(dynamic jsns) {
    if (jsns != null) {
      return jsns.map<TypeVehicle>((ct) {
        return TypeVehicle.fromJson(ct);
      }).toList();
    }

    return null;
  }
}
