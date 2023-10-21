class ProductReviewModel {
  String? msg;
  List<ProductReviewData>? data;

  ProductReviewModel({this.msg, this.data});

  ProductReviewModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <ProductReviewData>[];
      json['data'].forEach((v) {
        data!.add(ProductReviewData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductReviewData {
  int? id;
  String? description;
  String? rating;
  int? customerId;
  int? productId;
  String? createdAt;
  String? updatedAt;
  Profile? profile;

  ProductReviewData(
      {this.id,
      this.description,
      this.rating,
      this.customerId,
      this.productId,
      this.createdAt,
      this.updatedAt,
      this.profile});

  ProductReviewData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    rating = json['rating'];
    customerId = json['customer_id'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['rating'] = rating;
    data['customer_id'] = customerId;
    data['product_id'] = productId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}

class Profile {
  int? id;
  String? cusName;

  Profile({this.id, this.cusName});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cusName = json['cus_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cus_name'] = cusName;
    return data;
  }
}
