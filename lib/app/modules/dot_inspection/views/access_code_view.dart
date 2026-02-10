import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_text.dart';
import '../controllers/access_code_controller.dart';

class AccessCodeView extends GetView<AccessCodeController> {
  const AccessCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ensuring controller is found if not binding directly in GetPage (we should add binding)
    // Actually relying on GetPage binding property.
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(
          "Access Code",
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 24.sp),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit_outlined, color: Colors.white, size: 24.sp),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: CustomText(
                        controller.isConfirming.value
                            ? "Confirm your access code"
                            : "Set a 4-digit access code to lock the app in DOT Inspection Mode, you will have to re-enter the code to exit DOT inspection Mode",
                        color: Colors.grey[700],
                        fontSize: 15.sp,
                        textAlign: TextAlign.center,
                      ),
                    )),
                SizedBox(height: 40.h),
                // Code Indicators
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        bool filled = index < controller.code.value.length;
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.w),
                          width: 40.w,
                          child: Column(
                            children: [
                              CustomText(
                                filled ? controller.code.value[index] : "",
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              SizedBox(height: 8.h),
                              Container(
                                height: 2,
                                color: filled ? Colors.black : Colors.grey[400],
                              ),
                            ],
                          ),
                        );
                      }),
                    )),
                SizedBox(height: 40.h),
                TextButton(
                  onPressed: controller.onSkip,
                  child: CustomText(
                    "Skip to DOT Inspection Mode",
                    color: AppColors.primary,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Keypad
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.only(bottom: 16.h),
            child: Column(
              children: [
                _buildKeyRow(["1", "2", "3"], ["", "ABC", "DEF"]),
                _buildKeyRow(["4", "5", "6"], ["GHI", "JKL", "MNO"]),
                _buildKeyRow(["7", "8", "9"], ["PQRS", "TUV", "WXYZ"]),
                _buildKeyRow(["", "0", "back"], ["", "", ""]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyRow(List<String> keys, List<String> subTexts) {
    return Row(
      children: List.generate(keys.length, (index) {
        String key = keys[index];
        if (key.isEmpty) return Expanded(child: SizedBox());
        if (key == "back") {
          return Expanded(
            child: InkWell(
              onTap: controller.onBackspace,
              child: Container(
                height: 64.h,
                alignment: Alignment.center,
                child: Icon(Icons.backspace_outlined,
                    size: 24.sp, color: Colors.black),
              ),
            ),
          );
        }
        return Expanded(
          child: InkWell(
            onTap: () => controller.onKeyTap(key),
            child: Container(
              margin: EdgeInsets.all(4.w),
              height: 56.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.r),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 1,
                      offset: Offset(0, 1))
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(key,
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500)),
                  if (subTexts[index].isNotEmpty)
                    Text(subTexts[index],
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5)),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
