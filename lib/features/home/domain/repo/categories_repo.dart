import 'package:dartz/dartz.dart';
import 'package:unoapp/core/utils/failures.dart';
import 'package:unoapp/features/home/domain/entity/categories_entity.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}
