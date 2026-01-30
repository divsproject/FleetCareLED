import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_text.dart';
import '../../../global_widgets/custom_text_field.dart';
import '../controllers/co_driver_login_controller.dart';

class CoDriverLoginView extends StatelessWidget {
  const CoDriverLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoDriverLoginController>(
      init: CoDriverLoginController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              // 🔹 BACKGROUND IMAGE
              Positioned.fill(
                child: Image.asset(
                  'assets/images/truck.png',
                  fit: BoxFit.cover,
                ),
              ),

              // 🔹 CENTERED CARD
              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // LOGO
                        Center(
                          child: Image.asset(
                            'assets/images/logo.png',
                            height: 60,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 30),

                        // CO-DRIVER EMAIL
                        const CustomText(
                          "Co-driver Email",
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          hintText: "Co-driver Email",
                          controller: controller.emailController,
                        ),
                        const SizedBox(height: 20),

                        // PASSWORD
                        const CustomText(
                          "Password",
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          hintText: "Enter Password",
                          obscureText: controller.obscurePassword,
                          controller: controller.passwordController,
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.obscurePassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.black54,
                            ),
                            onPressed: controller.togglePasswordVisibility,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // REMEMBER ME & FORGOT PASSWORD
                        Row(
                          children: [
                            SizedBox(
                              height: 24,
                              width: 24,
                              child: Checkbox(
                                value: controller.rememberMe,
                                onChanged: controller.toggleRememberMe,
                                side: const BorderSide(
                                    color: AppColors.inputBorder),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: CustomText("Remember me",
                                  fontSize: 14, color: AppColors.textSecondary),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Forgot password action
                              },
                              child: const CustomText(
                                "Forgot Password?",
                                color: AppColors.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 24),

                        // LOGIN BUTTON
                        CustomButton(
                          label: "Login",
                          onPressed: controller.login,
                          height: 48,
                          borderRadius: 30,
                        ),

                        const SizedBox(height: 20),
                      ],
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
