class ActivityDetail{
  String name;
  String id;

  ActivityDetail({this.name , this.id});

  ActivityDetail.fromJson(Map<String , dynamic>json){
    name = json["name"];
    id = json["id"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) data['name'] = this.name;
    if (this.id != null) data['id'] = this.id;
    return data;
  }

  List<ActivityDetail> listFromJson(dynamic jsns) {
    if (jsns != null) {
      return jsns.map<ActivityDetail>((ct) {
        return ActivityDetail.fromJson(ct);
      }).toList();
    }

    return null;
  }
}