import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart'
    hide ResponsiveAppExtensions;
import '../../../core/values/app_constants.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_text_field.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout.builder(
        mobile: (context) => _buildMobileLayout(context),
        tablet: (context) => _buildTabletLayout(context),
        desktop: (context) => _buildDesktopLayout(context),
      ),
    );
  }

  // Mobile Layout: Full screen with background overridden or simple stack
  Widget _buildMobileLayout(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/truck.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: LoginForm(
            width: 1.sw, // Full width
            padding: EdgeInsets.all(20.w),
            isMobile: true,
          ),
        ),
      ),
    );
  }

  // Tablet Layout: Centered Card over background (Fixed Size)
  Widget _buildTabletLayout(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/truck.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: LoginForm(
            width: kAuthCardWidth, // Fixed logical pixels
            height: kAuthCardHeight,
            padding: EdgeInsets.all(30.r), // Use .r for adaptive padding
            isMobile: false,
          ),
        ),
      ),
    );
  }

  // Desktop Layout: Split View (Logo Left, Form Right) or Centered Card
  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        // Left Side: Image/Branding
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.blue.shade50, // Placeholder or branded background
            child: Center(
              child: Image.asset("assets/images/logo.png", width: 200.w),
            ),
          ),
        ),
        // Right Side: Login Form
        Expanded(
          flex: 1,
          child: Center(
            child: SingleChildScrollView(
              child: LoginForm(
                width: kAuthCardWidth, // Fixed logical pixels
                height: kAuthCardHeight,
                padding: EdgeInsets.all(40.r),
                isMobile: false,
                showLogo: false, // Hide logo in form since it's on the left
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LoginForm extends StatelessWidget {
  final double width;
  final double? height; // Add height parameter
  final EdgeInsetsGeometry padding;
  final bool isMobile;
  final bool showLogo;

  const LoginForm({
    Key? key,
    required this.width,
    this.height,
    required this.padding,
    required this.isMobile,
    this.showLogo = true,
  }) : super(key: key);

  // Helper
  double _sp(double val) => isMobile ? val.sp : val;
  double _h(double val) => isMobile ? val.h : val;
  double _w(double val) => isMobile ? val.w : val;
  double _r(double val) => isMobile ? val.r : val;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Container(
      width: width,
      height: isMobile ? null : height, // Apply fixed height only if not mobile
      margin:
          isMobile ? EdgeInsets.zero : EdgeInsets.symmetric(vertical: _h(20)),
      padding: padding,
      decoration: isMobile
          ? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(_r(18)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: _r(10),
                ),
              ],
            )
          : BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
      child: isMobile
          ? _buildFormContent(
              controller) // Just the form content for mobile which wraps content
          : Center(
              child: SingleChildScrollView(
                  child: _buildFormContent(
                      controller))), // Center content in fixed height box
    );
  }

  Widget _buildFormContent(LoginController controller) {
    return Form(
      key: controller.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 🔹 LOGO
          if (showLogo) ...[
            Image.asset("assets/images/logo.png", height: _h(60)),
            SizedBox(height: _h(20)),
          ],

          // 🔹 HEADER TEXT
          Text(
            "Welcome Back!",
            style: TextStyle(
              fontSize: _sp(24),
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: _h(8)),
          Text(
            "Login to your account",
            style: TextStyle(
              fontSize: _sp(14),
              color: Colors.grey,
            ),
          ),
          SizedBox(height: _h(30)),

          // 🔹 DRIVER EMAIL (USERNAME)
          CustomTextField(
            label: "Username",
            hintText: " Driver name",
            icon: Icons.person_outline,
            controller: controller.usernameController,
            validator: controller.validateUsername,
            isResponsive: isMobile,
          ),

          SizedBox(height: _h(14)),

          // 🔹 PASSWORD
          Obx(
            () => CustomTextField(
              label: "Password",
              hintText: "Enter Password",
              icon: Icons.lock_outline,
              isPassword: true,
              controller: controller.passwordController,
              validator: controller.validatePassword,
              obscureText: controller.obscurePassword.value,
              onTogglePassword: controller.togglePasswordVisibility,
              isResponsive: isMobile,
            ),
          ),

          SizedBox(height: _h(10)),

          // 🔹 REMEMBER + FORGOT
          Row(
            children: [
              Obx(
                () => SizedBox(
                  width: _w(24),
                  height: _w(24),
                  child: Checkbox(
                    value: controller.rememberMe.value,
                    activeColor: const Color(0xFF2AA6DF),
                    onChanged: (v) => controller.rememberMe.value = v!,
                  ),
                ),
              ),
              SizedBox(width: _w(8)),
              Text("Remember me", style: TextStyle(fontSize: _sp(14))),
              const Spacer(),
              TextButton(
                onPressed: controller.navigateToForgotPassword,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: const Color(0xFF2AA6DF), fontSize: _sp(14)),
                ),
              ),
            ],
          ),

          SizedBox(height: _h(12)),

          // 🔹 LOGIN BUTTON
          Obx(
            () => CustomButton(
              label: "LOGIN",
              onPressed: controller.login,
              isLoading: controller.isLoading.value,
              backgroundColor: const Color(0xFF2AA6DF),
              borderRadius: isMobile ? 30.r : 30,
              isResponsive: isMobile,
            ),
          ),

          SizedBox(height: _h(16)),
        ],
      ),
    );
  }
}
