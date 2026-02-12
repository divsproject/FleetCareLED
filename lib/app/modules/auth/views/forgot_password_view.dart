import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart'
    hide ResponsiveAppExtensions;
import '../../../core/values/app_constants.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_text_field.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);

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

  // Mobile Layout: Full screen with background
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
          child: ForgotPasswordForm(
            width: 1.sw,
            padding: EdgeInsets.only(
                top: 20.h, bottom: 20.h, left: 20.w, right: 20.w),
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
        child: ForgotPasswordForm(
          width: kAuthCardWidth,
          height: kAuthCardHeight,
          padding:
              EdgeInsets.only(top: 30.h, bottom: 30.h, left: 30.w, right: 30.w),
          isMobile: false,
        ),
      ),
    );
  }

  // Desktop Layout: Split View
  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        // Left Side: Image/Branding
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.blue.shade50,
            child: Center(
              child: Image.asset("assets/images/logo.png", width: 200.w),
            ),
          ),
        ),
        // Right Side: Form
        Expanded(
          flex: 1,
          child: Center(
            child: ForgotPasswordForm(
              width: kAuthCardWidth,
              height: kAuthCardHeight,
              padding: EdgeInsets.only(
                  top: 20.h, bottom: 20.h, left: 20.w, right: 20.w),
              isMobile: false,
              showLogo: false,
            ),
          ),
        ),
      ],
    );
  }
}

class ForgotPasswordForm extends StatelessWidget {
  final double width;
  final double? height;
  final EdgeInsetsGeometry padding;
  final bool isMobile;
  final bool showLogo;

  const ForgotPasswordForm({
    Key? key,
    required this.width,
    this.height,
    required this.padding,
    required this.isMobile,
    this.showLogo = true,
  }) : super(key: key);

  // Helper
  double _sp(double val) => isMobile ? val.spMin : val;
  double _h(double val) => isMobile ? val.h : val;
  double _r(double val) => isMobile ? val.r : val;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgotPasswordController>();

    return Container(
      width: width,
      height: isMobile ? null : height,
      margin:
          isMobile ? EdgeInsets.zero : EdgeInsets.symmetric(vertical: _h(20)),
      padding: padding,
      decoration: isMobile
          ? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
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
          ? _buildFormContent(controller)
          : Center(
              child:
                  SingleChildScrollView(child: _buildFormContent(controller))),
    );
  }

  Widget _buildFormContent(ForgotPasswordController controller) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showLogo) ...[
          Image.asset(
            'assets/images/logo.png',
            height: _h(70),
          ),
          SizedBox(height: _h(20)),
        ],
        Text(
          "Forgot Password",
          style: TextStyle(
            fontSize: _sp(24),
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: _h(10)),
        Text(
          "Enter your registered email.\nWe will send you a reset link.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black54,
            fontSize: _sp(14),
          ),
        ),
        SizedBox(height: _h(30)),
        CustomTextField(
          label: "Email Address",
          hintText: "Enter Email Address",
          icon: Icons.email_outlined,
          controller: controller.emailController,
          validator: controller.validateEmail,
          isResponsive: isMobile,
        ),
        SizedBox(height: _h(25)),
        Obx(() => CustomButton(
              label: "Send Reset Link",
              onPressed: controller.sendResetLink,
              isLoading: controller.isLoading.value,
              backgroundColor: AppColors.primary,
              borderRadius: isMobile ? 30.r : 30,
              height: isMobile ? 50.h : 50,
              isResponsive: isMobile,
            )),
        SizedBox(height: _h(20)),
        GestureDetector(
          onTap: () => Get.back(),
          child: Text(
            "Back to Login",
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 14.spMin,
            ),
          ),
        ),
      ],
    );
  }
}
