import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
  final isLoading = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    if (!GetUtils.isEmail(value)) return 'Enter valid email';
    return null;
  }

  void sendResetLink() async {
    if (validateEmail(emailController.text) == null) {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2)); // Mock API
      isLoading.value = false;
      Get.dialog(
        AlertDialog(
          title: const Text("Email Sent"),
          content: const Text("Password reset link sent successfully."),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); // close dialog
                Get.back(); // back to login
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }
}
