import 'package:dartz/dartz.dart';
import 'package:unoapp/core/utils/failures.dart';
import 'package:unoapp/features/home/domain/entity/categories_entity.dart';
import 'package:unoapp/features/home/domain/repo/categories_repo.dart';

class GetCategoriesUseCase {
  final CategoryRepository repository;

  GetCategoriesUseCase({required this.repository});

  Future<Either<Failure, List<CategoryEntity>>> call() {
    return repository.getCategories();
  }
}
