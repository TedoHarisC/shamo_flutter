import 'package:shamo/model/category_model.dart';
import 'package:shamo/model/gallery_model.dart';

class ProductModel {
  late int id;
  late String name;
  late double price;
  late String description;
  String? tags;
  CategoryModel? category;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<GalleryModel>? galleries;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    this.tags,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.galleries,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    price = double.parse(json["price"].toString());
    description = json["description"];
    tags = json["tags"];
    category = CategoryModel.fromJson(json["category"]);
    galleries = json["galleries"]
        .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
        .toList();
    createdAt = DateTime.parse(json["created_at"]);
    updatedAt = DateTime.parse(json["updated_at"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'category': category!.toJson(),
      'galleries': galleries!.map((gallery) => gallery.toJson()).toList(),
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }
}
