import 'Mall.dart';

class MallPost{
  String mallName;
  String neighbor;
  String maxFloor;
  int mallId;

  MallPost({
    this.mallName,
    this.neighbor,
    this.maxFloor,
    this.mallId,
});
  MallPost.fromJson(Map<String, dynamic> json){
    if(json != null){
      mallName = json['nameOFMall'];
      maxFloor = json['maxFloorOfMall'];
      neighbor = json['address'];
      mallId = json['id'];
    }
  }
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mallName != null) data['nameOFMall'] = this.mallName;
    if (this.neighbor != null) data['address'] = this.neighbor;
    if (this.maxFloor != null) data['maxFloorOfMall'] = this.maxFloor;
    if (this.mallId != null) data['id'] = this.mallId;

    return data;
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