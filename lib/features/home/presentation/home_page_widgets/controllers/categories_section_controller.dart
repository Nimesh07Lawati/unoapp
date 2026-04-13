import 'package:get/get.dart';
import 'package:unoapp/features/home/domain/entity/categories_entity.dart';
import 'package:unoapp/features/home/domain/use_cases/categories_use_cases.dart';

class CategoryController extends GetxController {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoryController({required this.getCategoriesUseCase});

  final RxList<CategoryEntity> categories = <CategoryEntity>[].obs;
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    isLoading.value = true;
    errorMessage.value = '';

    final result = await getCategoriesUseCase();

    result.fold(
      (failure) {
        errorMessage.value = failure.message;
        isLoading.value = false;
      },
      (data) {
        categories.assignAll(data);
        isLoading.value = false;
      },
    );
  }
}
