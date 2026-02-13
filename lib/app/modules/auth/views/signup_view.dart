import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_text.dart';
import '../../../global_widgets/custom_text_field.dart';
import '../controllers/signup_controller.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      init: SignupController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              // Background image
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child:
                    Image.asset('assets/images/truck.png', fit: BoxFit.cover),
              ),

              // Blue overlay
              Container(color: AppColors.primary.withOpacity(0.85)),

              // Card
              Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 20.h, bottom: 20.h, left: 20.w, right: 20.w),
                  child: Container(
                    padding: EdgeInsets.only(top: 20.h, bottom: 20.h, left: 20.w, right: 20.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/logo.png', height: 70.h),
                          SizedBox(height: 20.h),
                          CustomText(
                            "Create Account",
                            fontSize: 18.spMin,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 20.h),
                          CustomTextField(
                            label:
                                "", // Original uses only hint in _inputField helper
                            hintText: "Driver Email",
                            icon: Icons.email_outlined,
                            controller: controller.emailController,
                            validator: controller.validateEmail,
                          ),
                          SizedBox(height: 15.h),
                          Obx(
                            () => CustomTextField(
                              label: "",
                              hintText: "Password",
                              icon: Icons.lock_outline,
                              isPassword: true,
                              controller: controller.passwordController,
                              validator: controller.validatePassword,
                              obscureText: controller.obscurePassword.value,
                              onTogglePassword:
                                  controller.togglePasswordVisibility,
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Obx(
                            () => CustomTextField(
                              label: "",
                              hintText: "Confirm Password",
                              icon: Icons.lock_outline,
                              isPassword: true,
                              controller: controller.confirmPasswordController,
                              validator: (val) =>
                                  controller.validateConfirmPassword(
                                val,
                                controller.passwordController.text,
                              ),
                              obscureText:
                                  controller.obscureConfirmPassword.value,
                              onTogglePassword:
                                  controller.toggleConfirmPasswordVisibility,
                            ),
                          ),
                          SizedBox(height: 25.h),
                          Obx(
                            () => CustomButton(
                              label: "Create Account",
                              onPressed: controller.register,
                              isLoading: controller.isLoading.value,
                              backgroundColor: AppColors.primary,
                              borderRadius: 14.r,
                              height: 50.h,
                            ),
                          ),
                          SizedBox(height: 15.h),
                          GestureDetector(
                            onTap: () {
                              Get.back(); // Navigate back to Login
                            },
                            child: CustomText(
                              "Already have an account? Login",
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.spMin,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
