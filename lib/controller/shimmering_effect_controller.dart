// controllers/shimmer_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShimmerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> shimmerAnimation;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _initShimmerAnimation();
  }

  void _initShimmerAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    shimmerAnimation = Tween<double>(begin: -1.5, end: 1.5).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
  }

  void startLoading() {
    isLoading.value = true;
    animationController.repeat();
  }

  void stopLoading() {
    isLoading.value = false;
    animationController.stop();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
