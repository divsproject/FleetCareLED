import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;
  final obscurePassword = true.obs;
  final rememberMe = false.obs;

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() =>
      obscurePassword.value = !obscurePassword.value;

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) return 'Username is required';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    return null;
  }

  void navigateToSignup() {
    Get.toNamed(AppRoutes.SIGNUP);
  }

  void navigateToForgotPassword() {
    Get.toNamed(AppRoutes.FORGOT_PASSWORD);
  }

  void login() async {
    Get.offAllNamed(AppRoutes.ASSIGNMENT);

    // if (formKey.currentState!.validate()) {
    //   isLoading.value = true;
    //   await Future.delayed(const Duration(seconds: 2)); // Mock API logic
    //   isLoading.value = false;
    //   // Navigate to Assignment first as per original flow
    //   Get.offAllNamed(AppRoutes.ASSIGNMENT);
    // }
  }
}
