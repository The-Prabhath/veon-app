import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageindex = 0.obs;

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageindex.value = index;

  /// Jump to the specific dot selected page.
  void dotNavigationClick(index) {
    currentPageindex.value = index;
    pageController.jumpTo(index);
  }

  /// Update Current Index & jump to next page
  void nextPage() {
    if (currentPageindex.value == 2) {
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageindex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// Update Current Index & jump to the last Page
  void skipPage() {
    currentPageindex.value = 2;
    pageController.jumpToPage(2);
  }
}
