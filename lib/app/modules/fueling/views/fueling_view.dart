import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_text.dart';

class FuelingView extends StatelessWidget {
  const FuelingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const CustomText(
          "Fueling",
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
            // 🔹 Top Stats
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _Stat("35000", "km"),
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.lightBlueBg,
                    child: Icon(Icons.local_shipping, color: AppColors.primary),
                  ),
                  _Stat("800", "Avg"),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 🔹 Fueling List
            Expanded(
              child: ListView(
                children: const [
                  _FuelTile(),
                  _FuelTile(),
                  _FuelTile(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final String label;
  const _Stat(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          value,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        CustomText(
          label,
          fontSize: 12,
          color: AppColors.textSecondary,
        ),
      ],
    );
  }
}

class _FuelTile extends StatelessWidget {
  const _FuelTile();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            "55000 INR",
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 4),
          CustomText(
            "OCT 8 • 09:08 PM • Kalupur Station",
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}
