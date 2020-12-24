class MallToRegister {
  int locationOfRegisterId;
  String nameOFMall;
  String maxFloorOfMall;
  String minFloorOfMall;
  String noOfMall;
  String address;
  int locationLat;
  int locationLng;
  int id;

  MallToRegister(
      {this.locationOfRegisterId,
        this.nameOFMall,
        this.maxFloorOfMall,
        this.minFloorOfMall,
        this.noOfMall,
        this.address,
        this.locationLat,
        this.locationLng,
        this.id});

  MallToRegister.fromJson(Map<String, dynamic> json) {
    if(json['locationOfRegisterId'] != null) locationOfRegisterId = json['locationOfRegisterId'];
    if(json['nameOFMall'] != null) nameOFMall = json['nameOFMall'];
    if(json['maxFloorOfMall'] != null) maxFloorOfMall = json['maxFloorOfMall'];
    if(json['minFloorOfMall'] != null) minFloorOfMall = json['minFloorOfMall'];
    if(json['noOfMall'] != null ) noOfMall = json['noOfMall'];
    if(json['address'] != null ) address = json['address'];
    if(json['locationLat'] != null) locationLat = json['locationLat'];
    if(json['locationLng'] != null) locationLng = json['locationLng'];
    if(json['id'] != null ) id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.locationOfRegisterId != null) data['locationOfRegisterId'] = this.locationOfRegisterId;
    if(this.nameOFMall != null) data['nameOFMall'] = this.nameOFMall;
    if(this.maxFloorOfMall != null) data['maxFloorOfMall'] = this.maxFloorOfMall;
    if(this.minFloorOfMall != null) data['minFloorOfMall'] = this.minFloorOfMall;
    if(this.noOfMall != null) data['noOfMall'] = this.noOfMall;
    if(this.address != null) data['address'] = this.address;
    if(this.locationLat != null) data['locationLat'] = this.locationLat;
    if(this.locationLng != null) data['locationLng'] = this.locationLng;
    if(this.id != null) data['id'] = this.id;
    return data;
  }
}