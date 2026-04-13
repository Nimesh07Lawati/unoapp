import 'package:dartz/dartz.dart';
import 'package:unoapp/core/utils/failures.dart';
import 'package:unoapp/features/home/data/data_source/categories_remote_data_source.dart';
import 'package:unoapp/features/home/domain/entity/categories_entity.dart';
import 'package:unoapp/features/home/domain/repo/categories_repo.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final categories = await remoteDataSource.fetchCategories();
      return Right(categories);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
