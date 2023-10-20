class ProductModel {
  String? msg;
  List<ProductData>? data;

  ProductModel({this.msg, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data!.add(ProductData.fromJson(v));
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

class ProductData {
  int? id;
  String? title;
  String? shortDes;
  String? price;
  int? discount;
  String? discountPrice;
  String? image;
  int? stock;
  int? star;
  String? remark;
  int? categoryId;
  int? brandId;
  String? createdAt;
  String? updatedAt;
  Brand? brand;
  Category? category;

  ProductData(
      {this.id,
      this.title,
      this.shortDes,
      this.price,
      this.discount,
      this.discountPrice,
      this.image,
      this.stock,
      this.star,
      this.remark,
      this.categoryId,
      this.brandId,
      this.createdAt,
      this.updatedAt,
      this.brand,
      this.category});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDes = json['short_des'];
    price = json['price'];
    discount = json['discount'];
    discountPrice = json['discount_price'];
    image = json['image'];
    stock = json['stock'];
    star = json['star'];
    remark = json['remark'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['short_des'] = shortDes;
    data['price'] = price;
    data['discount'] = discount;
    data['discount_price'] = discountPrice;
    data['image'] = image;
    data['stock'] = stock;
    data['star'] = star;
    data['remark'] = remark;
    data['category_id'] = categoryId;
    data['brand_id'] = brandId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class Brand {
  int? id;
  String? brandName;
  String? brandImg;
  String? createdAt;
  String? updatedAt;

  Brand(
      {this.id, this.brandName, this.brandImg, this.createdAt, this.updatedAt});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brandName'];
    brandImg = json['brandImg'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['brandName'] = brandName;
    data['brandImg'] = brandImg;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Category {
  int? id;
  String? categoryName;
  String? categoryImg;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
      this.categoryName,
      this.categoryImg,
      this.createdAt,
      this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['categoryName'];
    categoryImg = json['categoryImg'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['categoryName'] = categoryName;
    data['categoryImg'] = categoryImg;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
