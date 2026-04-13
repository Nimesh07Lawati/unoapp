import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:unoapp/features/home/data/data_source/categories_remote_data_source.dart';
import 'package:unoapp/features/home/data/repo_impl/categories_repo_impl.dart';
import 'package:unoapp/features/home/domain/use_cases/categories_use_cases.dart';
import 'package:unoapp/features/home/presentation/home_page_widgets/controllers/categories_section_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(
      () => CategoryController(
        getCategoriesUseCase: GetCategoriesUseCase(
          repository: CategoryRepositoryImpl(
            remoteDataSource: CategoryRemoteDataSourceImpl(dio: Dio()),
          ),
        ),
      ),
    );
  }
}
