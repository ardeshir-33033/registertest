class LocationOfRegister {
  String name;
  int order;
  int id;

  LocationOfRegister({this.name, this.order, this.id});

  LocationOfRegister.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    order = json['order'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) data['name'] = this.name;
    if (this.order != null) data['order'] = this.order;
    if (this.id != null) data['id'] = this.id;
    return data;
  }

  List<LocationOfRegister> listFromJson(dynamic jsns) {
    if (jsns != null) {
      return jsns.map<LocationOfRegister>((ct) {
        return LocationOfRegister.fromJson(ct);
      }).toList();
    }

    return null;
  }
}
