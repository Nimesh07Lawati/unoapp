import 'package:unoapp/features/home/domain/entity/categories_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id, // so we are declaring this in super because it is already declared in the entity
    required super.name,
    required super.imgName,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int,
      name: json['name'] as String,
      imgName: json['img_name'] as String? ?? '',
    );
  }
}
