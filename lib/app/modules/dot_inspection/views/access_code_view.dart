import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_text.dart';
import '../../../global_widgets/custom_app_bar.dart';
import '../controllers/access_code_controller.dart';

class AccessCodeView extends GetView<AccessCodeController> {
  const AccessCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ensuring controller is found if not binding directly in GetPage (we should add binding)
    // Actually relying on GetPage binding property.

    // Request focus on build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.requestFocus();
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Access Code",
        actions: [
          IconButton(
            icon:
                Icon(Icons.edit_outlined, color: Colors.white, size: 24.spMin),
            onPressed: () {},
          )
        ],
      ),
      body: GestureDetector(
        onTap: controller.requestFocus,
        child: Stack(
          children: [
            // Hidden TextField to capture input
            Positioned(
              width: 0,
              height: 0,
              child: TextField(
                controller: controller.textController,
                focusNode: controller.focusNode,
                keyboardType: TextInputType.number,
                autofocus: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
            ),
            Column(
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
                              fontSize: 15.spMin,
                              textAlign: TextAlign.center,
                            ),
                          )),
                      SizedBox(height: 40.h),
                      // Code Indicators
                      Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(4, (index) {
                              bool filled =
                                  index < controller.code.value.length;
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 8.w),
                                width: 40.w,
                                child: Column(
                                  children: [
                                    CustomText(
                                      filled
                                          ? controller.code.value[index]
                                          : "",
                                      fontSize: 22.spMin,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    SizedBox(height: 8.h),
                                    Container(
                                      height: 2,
                                      color: filled
                                          ? Colors.black
                                          : Colors.grey[400],
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
                          fontSize: 15.spMin,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // Keypad Keypad removed, system keyboard used
              ],
            ),
          ],
        ),
      ),
    );
  }
}
