class ProductDetailsModel {
  String? msg;
  List<ProductDetailsData>? data;

  ProductDetailsModel({this.msg, this.data});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <ProductDetailsData>[];
      json['data'].forEach((v) {
        data!.add(ProductDetailsData.fromJson(v));
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

class ProductDetailsData {
  int? id;
  String? img1;
  String? img2;
  String? img3;
  String? img4;
  String? des;
  String? color;
  String? size;
  int? productId;
  String? createdAt;
  String? updatedAt;
  Product? product;

  ProductDetailsData(
      {this.id,
      this.img1,
      this.img2,
      this.img3,
      this.img4,
      this.des,
      this.color,
      this.size,
      this.productId,
      this.createdAt,
      this.updatedAt,
      this.product});

  ProductDetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img1 = json['img1'];
    img2 = json['img2'];
    img3 = json['img3'];
    img4 = json['img4'];
    des = json['des'];
    color = json['color'];
    size = json['size'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['img1'] = img1;
    data['img2'] = img2;
    data['img3'] = img3;
    data['img4'] = img4;
    data['des'] = des;
    data['color'] = color;
    data['size'] = size;
    data['product_id'] = productId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Product {
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

  Product(
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

  Product.fromJson(Map<String, dynamic> json) {
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
