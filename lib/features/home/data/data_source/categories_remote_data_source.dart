import 'package:dio/dio.dart';
import 'package:unoapp/core/network/api_end_points.dart';
import 'package:unoapp/features/home/data/model/categories_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> fetchCategories();

  // this is the method to fetch empty categories, used for testing purposes only, to be removed later
  Future<List<CategoryModel>> fetchEmptyCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final Dio dio;

  CategoryRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    final response = await dio.get(ApiEndPoints.getAllCategories);
    // Dio automatically throws an error if statusCode is not 200-299
    final List categoriesJson = response.data['data']['categories'] as List;
    return categoriesJson
        .map((json) => CategoryModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  // This method is for testing purposes only, to be removed later
  @override
  Future<List<CategoryModel>> fetchEmptyCategories() async {
    return [];
  }
}
