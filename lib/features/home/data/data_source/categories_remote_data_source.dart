import 'package:dio/dio.dart';
import 'package:unoapp/features/home/data/model/categories_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> fetchCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final Dio dio;

  CategoryRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    final response = await dio.get(
      'https://rentsy.com.au/api/customer/categories',
    );

    if (response.statusCode == 200) {
      final data = response.data;
      final List categoriesJson = data['data']['categories'] as List;
      return categoriesJson
          .map((json) => CategoryModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
