import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_text.dart';

class DvirView extends StatelessWidget {
  const DvirView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const CustomText(
          "DVIRs",
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: AppColors.lightBlueBg,
            child: Icon(Icons.assignment, size: 36, color: AppColors.primary),
          ),
          const SizedBox(height: 16),
          const CustomText(
            "No DVIRs Available",
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 6),
          const CustomText(
            "Tap the button below to create a DVIR.",
            color: AppColors.textSecondary,
            fontSize: 12,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: CustomButton(
              label: "Create DVIR",
              height: 46,
              borderRadius: 24,
              onPressed: () {
                // Create DVIR
              },
            ),
          ),
        ],
      ),
    );
  }
}
