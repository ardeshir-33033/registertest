import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  String id;
  String displayName;
  String photoUrl;
  String email;

  GoogleAuth({this.id, this.displayName, this.photoUrl, this.email});

  GoogleAuth.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['displayName'];
    photoUrl = json['photoUrl'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id ??"";
    data['displayName'] = this.displayName ??"";
    data['photoUrl'] = this.photoUrl ??"";
    data['email'] = this.email ??"";
    return data;
  }


}

