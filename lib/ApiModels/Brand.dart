import 'TypeBrand.dart';
import 'Vehicle.dart';

class Brand {
  String englishName;
  String persianName;
  int userId;
  TypeBrand typeBrand;
  int typeBrandId;
  Vehicle vehicle;
  int vehicleId;
  int id;
  String madeInContry;

  Brand(
      {this.englishName,
      this.persianName,
      this.userId,
      this.typeBrand,
      this.typeBrandId,
      this.vehicle,
      this.vehicleId,
      this.id,
      this.madeInContry});

  Brand.fromJson(Map<String, dynamic> json) {
    englishName = json['englishName'];
    persianName = json['persianName'];
    userId = json['userId'];
    typeBrand = json['typeBrand'] != null
        ? new TypeBrand.fromJson(json['typeBrand'])
        : null;
    typeBrandId = json['typeBrandId'];
    vehicle =
        json['vehicle'] != null ? new Vehicle.fromJson(json['vehicle']) : null;
    vehicleId = json['vehicleId'];
    id = json['id'];
    madeInContry = json['madeInContry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.englishName != null) data['englishName'] = this.englishName;
    if (this.persianName != null) data['persianName'] = this.persianName;
    if (this.userId != null) data['userId'] = this.userId;
    if (this.typeBrand != null) {
      data['typeBrand'] = this.typeBrand.toJson();
    }
    if (this.typeBrandId != null) data['typeBrandId'] = this.typeBrandId;
    if (this.vehicle != null) {
      data['vehicle'] = this.vehicle.toJson();
    }
    if (this.vehicleId != null) data['vehicleId'] = this.vehicleId;
    if (this.id != null) data['id'] = this.id;
    if (this.madeInContry != null) data['madeInContry'] = this.madeInContry;
    return data;
  }

  List<Brand> listFromJson(dynamic jsns) {
    if (jsns != null) {
      return jsns.map<Brand>((ct) {
        return Brand.fromJson(ct);
      }).toList();
    }

    return null;
  }
}
