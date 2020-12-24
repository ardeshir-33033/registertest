class Mall{
  String mallName;
  String neighbor;
  String maxFloor;
  int id;


  Mall({
    this.mallName,
    this.neighbor,
    this.maxFloor,
    this.id,
});
  Mall.fromJson(Map <String , dynamic>json){
    mallName = json['nameOFMall'];
    neighbor = json['address'];
    maxFloor = json['maxFloorOfMall'];
    id = json['id'];

  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mallName != null) data['nameOFMall'] = this.mallName;
    if (this.neighbor != null) data['address'] = this.neighbor;
    if (this.maxFloor != null) data['maxFloorOfMall'] = this.maxFloor;
    if (this.id != null) data['id'] = this.id;

  }
  List<Mall> listFromJson(dynamic jsns) {
    if (jsns != null) {
      return jsns.map<Mall>((ct) {
        return Mall.fromJson(ct);
      }).toList();
    }

    return null;
  }
}