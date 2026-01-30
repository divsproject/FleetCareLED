import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/custom_button.dart';
import '../../../../global_widgets/custom_textfield.dart';
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
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/logo.png', height: 70),
                          const SizedBox(height: 20),
                          const Text(
                            "Create Account",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            label:
                                "", // Original uses only hint in _inputField helper
                            hint: "Driver Email",
                            icon: Icons.email_outlined,
                            controller: controller.emailController,
                            validator: controller.validateEmail,
                          ),
                          const SizedBox(height: 15),
                          Obx(
                            () => CustomTextField(
                              label: "",
                              hint: "Password",
                              icon: Icons.lock_outline,
                              isPassword: true,
                              controller: controller.passwordController,
                              validator: controller.validatePassword,
                              obscureText: controller.obscurePassword.value,
                              onTogglePassword:
                                  controller.togglePasswordVisibility,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Obx(
                            () => CustomTextField(
                              label: "",
                              hint: "Confirm Password",
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
                          const SizedBox(height: 25),
                          Obx(
                            () => CustomButton(
                              text: "Create Account",
                              onPressed: controller.register,
                              isLoading: controller.isLoading.value,
                              backgroundColor: Colors.blue,
                              borderRadius: 14, // Matches source code
                            ),
                          ),
                          const SizedBox(height: 15),
                          GestureDetector(
                            onTap: () {
                              Get.back(); // Navigate back to Login
                            },
                            child: const Text(
                              "Already have an account? Login",
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
              ),
            ],
          ),
        );
      },
    );
  }
}
