import 'TypeBrand.dart';
import 'Vehicle.dart';

class BrandPost {
  String englishName;
  String persianName;
  int brandId;
  int typeBrandId;
  String madeInContry;

  BrandPost({
    this.englishName,
    this.persianName,
    this.typeBrandId,
    this.brandId,
    this.madeInContry,
  });

  BrandPost.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      englishName = json['englishName'];
      persianName = json['persianName'];
      brandId = json['brandId'];
      typeBrandId = json['typeBrandId'];
      madeInContry = json['madeInContry'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.englishName != null) data['englishName'] = this.englishName;
    if (this.persianName != null) data['persianName'] = this.persianName;
    if (this.brandId != null) data['brandId'] = this.brandId;
    if (this.typeBrandId != null) data['typeBrandId'] = this.typeBrandId;
    if (this.madeInContry != null) data['madeInContry'] = this.madeInContry;
    return data;
  }

  List<BrandPost> listFromJson(dynamic jsns) {
    if (jsns != null) {
      return jsns.map<BrandPost>((ct) {
        return BrandPost.fromJson(ct);
      }).toList();
    }

    return null;
  }
}
