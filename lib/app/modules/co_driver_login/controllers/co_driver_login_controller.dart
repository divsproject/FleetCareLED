import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoDriverLoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;
  bool rememberMe = false;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    update();
  }

  void toggleRememberMe(bool? value) {
    rememberMe = value ?? false;
    update();
  }

  void login() {
    // Implement login logic here
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Please enter email and password");
      return;
    }

    // Determine login success
    Get.snackbar("Success", "Co-Driver Logged In");
    Get.back();
  }
}
