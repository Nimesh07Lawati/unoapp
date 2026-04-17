import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:unoapp/core/utils/failures.dart';
import 'package:unoapp/features/home/domain/entity/categories_entity.dart';
import 'package:unoapp/features/home/domain/use_cases/categories_use_cases.dart';

class CategoryController extends GetxController {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoryController({required this.getCategoriesUseCase});

  final RxList<CategoryEntity> categories = <CategoryEntity>[].obs;
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;

  // Add these for more granular control
  final RxBool hasError = false.obs;
  final Rx<ErrorType?> errorType = Rx<ErrorType?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    isLoading.value = true;
    errorMessage.value = '';
    hasError.value = false;
    errorType.value = null;

    final result = await getCategoriesUseCase();

    result.fold(
      (failure) {
        errorMessage.value = failure.message;
        hasError.value = true;
        errorType.value = switch (failure) {
          NetworkFailure() => ErrorType.network,
          TimeoutFailure() => ErrorType.timeout,
          _ => ErrorType.unknown,
        };
        isLoading.value = false;
      },
      (data) {
        categories.assignAll(data);
        isLoading.value = false;
        hasError.value = false;
      },
    );
  }
}

enum ErrorType { network, timeout, unknown }
