class ContactTypeVM {
  String value;
  String id;

  ContactTypeVM({
    this.value,
    this.id,
  });

  ContactTypeVM.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.value != null) data['value'] = this.value;
    if (this.id != null) data['id'] = this.id;
    return data;
  }
}
