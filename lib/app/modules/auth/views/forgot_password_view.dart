import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/custom_button.dart';
import '../../../../global_widgets/custom_textfield.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
      init: ForgotPasswordController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              // Background Image
              Image.asset(
                'assets/images/truck.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),

              // Blue Overlay
              Container(color: Colors.blue.withOpacity(0.85)),

              // Card
              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: 70,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Forgot Password",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Enter your registered email.\nWe will send you a reset link.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          label: "",
                          hint: "Email Address",
                          icon: Icons.email_outlined,
                          controller: controller.emailController,
                          validator: controller.validateEmail,
                        ),
                        const SizedBox(height: 25),
                        Obx(() => CustomButton(
                              text: "Send Reset Link",
                              onPressed: controller.sendResetLink,
                              isLoading: controller.isLoading.value,
                              backgroundColor: Colors.blue,
                              borderRadius: 14, // Matches source code
                            )),
                        const SizedBox(height: 15),
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: const Text(
                            "Back to Login",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
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
