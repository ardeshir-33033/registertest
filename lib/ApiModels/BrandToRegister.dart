import 'Brand.dart';
import 'BrandPost.dart';

class BrandToRegister {
  BrandPost brand;
  int brandId;

  BrandToRegister({
    this.brand,
    this.brandId,
  });

  BrandToRegister.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      brand = BrandPost.fromJson(json["brand"]);
      brandId = json['brandId'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.brandId != null) data['brandId'] = this.brandId;
    if (this.brand != null) data['brand'] = this.brand.toJson();
    return data;
  }

  List<BrandToRegister> listFromJson(dynamic jsns) {
    if (jsns != null) {
      return jsns.map<BrandToRegister>((ct) {
        return BrandToRegister.fromJson(ct);
      }).toList();
    }

    return null;
  }
}
