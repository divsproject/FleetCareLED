import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/custom_button.dart';
import '../../../../global_widgets/custom_textfield.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/truck.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // 🔹 LOGO
                        Image.asset("assets/images/logo.png", height: 60),

                        const SizedBox(height: 20),

                        // 🔹 DRIVER EMAIL (USERNAME)
                        CustomTextField(
                          label: "Username",
                          hint: " Driver name",
                          icon: Icons.person_outline,
                          controller: controller.usernameController,
                          validator: controller.validateUsername,
                        ),

                        const SizedBox(height: 14),

                        // 🔹 PASSWORD
                        Obx(
                          () => CustomTextField(
                            label: "Password",
                            hint: "Enter Password",
                            icon: Icons.lock_outline,
                            isPassword: true,
                            controller: controller.passwordController,
                            validator: controller.validatePassword,
                            obscureText: controller.obscurePassword.value,
                            onTogglePassword:
                                controller.togglePasswordVisibility,
                          ),
                        ),

                        const SizedBox(height: 10),

                        // 🔹 REMEMBER + FORGOT
                        Row(
                          children: [
                            Obx(
                              () => Checkbox(
                                value: controller.rememberMe.value,
                                activeColor: const Color(0xFF2AA6DF),
                                onChanged: (v) =>
                                    controller.rememberMe.value = v!,
                              ),
                            ),
                            const Text("Remember me"),
                            const Spacer(),
                            TextButton(
                              onPressed: controller.navigateToForgotPassword,
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(color: Color(0xFF2AA6DF)),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // 🔹 NEXT BUTTON
                        Obx(
                          () => CustomButton(
                            text: "LOGIN",
                            onPressed: controller.login,
                            isLoading: controller.isLoading.value,
                            backgroundColor: const Color(0xFF2AA6DF),
                            borderRadius: 30, // Original UI uses 30
                          ),
                        ),

                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
