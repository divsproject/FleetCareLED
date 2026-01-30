import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_text.dart';

class FormsView extends StatelessWidget {
  const FormsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const CustomText(
          "Forms",
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔹 Last Issue Card
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText("Tyre Issue"),
                  CustomText(
                    "Oct 8 • 8:08 PM",
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ],
              ),
            ),
            const Spacer(),

            // 🔹 Start a Form
            CustomButton(
              label: "Start a Form",
              onPressed: () {},
              borderRadius: 24,
            ),
            const SizedBox(height: 12),

            // 🔹 Create an Issue
            CustomButton(
              label: "Create an Issue",
              onPressed: () {},
              isOutlined: true,
              borderRadius: 24,
            ),
          ],
        ),
      ),
    );
  }
}
