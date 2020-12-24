class UserActivity {
  int activityId;

  UserActivity({this.activityId});

  UserActivity.fromJson(Map<String, dynamic> json) {
    activityId = json['activityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activityId'] = this.activityId;
    return data;
  }
}
