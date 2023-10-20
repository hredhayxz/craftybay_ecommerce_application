class CategoryModel {
  String? msg;
  List<CategoryData>? data;

  CategoryModel({this.msg, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <CategoryData>[];
      json['data'].forEach((v) {
        data!.add(CategoryData.fromJson(v));
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

class CategoryData {
  int? id;
  String? categoryName;
  String? categoryImg;
  String? createdAt;
  String? updatedAt;

  CategoryData(
      {this.id,
      this.categoryName,
      this.categoryImg,
      this.createdAt,
      this.updatedAt});

  CategoryData.fromJson(Map<String, dynamic> json) {
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
