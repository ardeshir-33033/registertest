import 'package:register/Models/ActivityDetail.dart';

class Activity{
  String name;
  int id;
 // List<ActivityDetail> detail;

  Activity({this.name , this.id ,
    //this.detail
  });

  Activity.fromJson(Map<String , dynamic>json){

    name = json["name"];
    id = json["id"];

    // if (json['activityDetails'] != null) {
    //   detail = new List<ActivityDetail>();
    //   json['activityDetails'].forEach((v) {
    //     detail.add(new ActivityDetail.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) data['name'] = this.name;
    if (this.id != null) data['id'] = this.id;
    //if (this.detail != null) data['activityDetails'] = this.detail;
    return data;
  }

  List<Activity> listFromJson(dynamic jsns) {
    if (jsns != null) {
      return jsns.map<Activity>((ct) {
        return Activity.fromJson(ct);
      }).toList();
    }

    return null;
  }
}