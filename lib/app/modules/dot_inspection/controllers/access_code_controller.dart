import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class AccessCodeController extends GetxController {
  final code = "".obs;
  final isConfirming = false.obs; // false = Set Mode, true = Confirm Mode
  final TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  String _firstCode = "";
  String? nextRoute;

  @override
  void onInit() {
    super.onInit();
    // Get the next route from arguments
    nextRoute = Get.arguments as String?;

    // Listen to text changes
    textController.addListener(() {
      final val = textController.text;
      if (val.length <= 4) {
        code.value = val;
        if (val.length == 4) {
          _handleCodeCompletion();
        }
      } else {
        // Prevent more than 4 chars
        textController.text = val.substring(0, 4);
        textController.selection = TextSelection.fromPosition(
            TextPosition(offset: textController.text.length));
      }
    });
  }

  @override
  void onClose() {
    textController.dispose();
    focusNode.dispose();
    super.onClose();
  }

  void requestFocus() {
    focusNode.requestFocus();
  }

  void _handleCodeCompletion() {
    if (!isConfirming.value) {
      // Set Mode Completed
      _firstCode = code.value;
      // Small delay for UX
      Future.delayed(const Duration(milliseconds: 300), () {
        code.value = "";
        textController.clear();
        isConfirming.value = true;
        requestFocus(); // Keep keyboard up
      });
    } else {
      // Confirm Mode Completed
      if (code.value == _firstCode) {
        // Success - navigate to the specified route or default
        final targetRoute = nextRoute ?? AppRoutes.DOT_INSPECTION_DETAIL;
        Get.offNamed(targetRoute);
      } else {
        // Mismatch
        Get.snackbar("Error", "Codes do not match. Please try again.");
        code.value = "";
        textController.clear();
        // Optional: Go back to 'Set' mode or just retry confirm?
        // Usually better to let them retry confirm or give option to reset start.
        // For now, let's reset to start if they fail, or just clear confirm.
        // Let's clear and stay in confirm for now, or reset whole flow?
        // Simple approach: Clear current code, stay in confirm.
      }
    }
  }

  void onSkip() {
    final targetRoute = nextRoute ?? AppRoutes.DOT_INSPECTION_DETAIL;
    Get.offNamed(targetRoute);
  }
}
