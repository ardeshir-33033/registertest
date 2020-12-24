import 'ContactModel.dart';

class PersonVM {
  String fname;
  String lname;
  String nickname;
  List<ContactModel> contacts;
  int workshopId = 0;
  String jobId;
  int creatorId;
  int id = 0;
  String createDm;
  String createDs;
  String lastUpdateDm;
  String lastUpdateDs;

  PersonVM({this.fname, this.lname, this.nickname, this.contacts, this.workshopId,this.jobId, this.creatorId, this.id, this.createDm, this.createDs, this.lastUpdateDm, this.lastUpdateDs});

  PersonVM.fromJson(Map<String, dynamic> json) {
    fname = json['fname'];
    lname = json['lname'];
    nickname = json['nickname'];
    if (json['contacts'] != null) {
      contacts = new List<ContactModel>();
      json['contacts'].forEach((v) { contacts.add(new ContactModel().fromJson(v)); });
    }
    workshopId = json['workshop_Id'];
    jobId = json['job_Id'];
    creatorId = json['creatorId'];
    id = json['id'];
    createDm = json['create_Dm'];
    createDs = json['create_Ds'];
    lastUpdateDm = json['lastUpdate_Dm'];
    lastUpdateDs = json['lastUpdate_Ds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.fname != null) data['fname'] = this.fname;
    if(this.lname != null) data['lname'] = this.lname;
    if(this.nickname != null) data['nickname'] = this.nickname;
    if (this.contacts != null) {
      data['contacts'] = this.contacts.map((v) => v.toJson()).toList();
    }
    if(this.workshopId != null) data['workshop_Id'] = this.workshopId;
    if(this.jobId != null) data['job_Id'] = this.jobId;
    if(this.creatorId != null) data['creatorId'] = this.creatorId;
    if(this.id != null) data['id'] = this.id;
    if(this.createDm != null) data['create_Dm'] = this.createDm;
    if(this.createDs != null) data['create_Ds'] = this.createDs;
    if(this.lastUpdateDm != null) data['lastUpdate_Dm'] = this.lastUpdateDm;
    if(this.lastUpdateDs != null) data['lastUpdate_Ds'] = this.lastUpdateDs;
    return data;
  }
}