import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart'
    hide ResponsiveAppExtensions;
import '../../../core/values/app_constants.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_button.dart';
// import '../../../global_widgets/custom_text.dart'; // Unused import removal
import '../../../global_widgets/custom_text_field.dart';
import '../controllers/co_driver_login_controller.dart';

class CoDriverLoginView extends GetView<CoDriverLoginController> {
  const CoDriverLoginView({Key? key}) : super(key: key);

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
          child: CoDriverLoginForm(
            width: 1.sw,
            padding: EdgeInsets.all(24.w),
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
          child: CoDriverLoginForm(
            width: kAuthCardWidth,
            height: kAuthCardHeight,
            padding: EdgeInsets.all(30.w),
            isMobile: false,
          ),
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
            child: SingleChildScrollView(
              child: CoDriverLoginForm(
                width: kAuthCardWidth,
                height: kAuthCardHeight,
                padding: EdgeInsets.all(40.w),
                isMobile: false,
                showLogo: false,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CoDriverLoginForm extends StatelessWidget {
  final double width;
  final double? height;
  final EdgeInsetsGeometry padding;
  final bool isMobile;
  final bool showLogo;

  const CoDriverLoginForm({
    Key? key,
    required this.width,
    this.height,
    required this.padding,
    required this.isMobile,
    this.showLogo = true,
  }) : super(key: key);

  // Helper
  // Helper
  double _sp(double val) => isMobile ? val.sp : val;
  double _h(double val) => isMobile ? val.h : val;
  double _w(double val) => isMobile ? val.w : val;
  double _r(double val) => isMobile ? val.r : val;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CoDriverLoginController>();

    return Container(
      width: width,
      height: isMobile ? null : height,
      margin:
          isMobile ? EdgeInsets.zero : EdgeInsets.symmetric(vertical: _h(20)),
      padding: padding,
      decoration: isMobile
          ? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(_r(18)),
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

  Widget _buildFormContent(CoDriverLoginController controller) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // LOGO
        if (showLogo) ...[
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              height: _h(60),
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: _h(30)),
        ],

        // HEADER
        Text(
          "Co-Driver Login",
          style: TextStyle(
            fontSize: _sp(24),
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: _h(20)),

        // CO-DRIVER EMAIL
        Text(
          "Co-driver Email",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: _sp(14),
          ),
        ),
        SizedBox(height: _h(8)),
        CustomTextField(
          hintText: "Co-driver Email",
          controller: controller.emailController,
          isResponsive: isMobile,
        ),
        SizedBox(height: _h(20)),

        // PASSWORD
        Text(
          "Password",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: _sp(14),
          ),
        ),
        SizedBox(height: _h(8)),
        CustomTextField(
          hintText: "Enter Password",
          obscureText: controller.obscurePassword,
          controller: controller.passwordController,
          isResponsive: isMobile,
          suffixIcon: IconButton(
            icon: Icon(
              controller.obscurePassword
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: Colors.black54,
              size: _sp(24),
            ),
            onPressed: controller.togglePasswordVisibility,
          ),
        ),
        SizedBox(height: _h(12)),

        // REMEMBER ME & FORGOT PASSWORD
        Row(
          children: [
            SizedBox(
              height: _w(24),
              width: _w(24),
              child: Checkbox(
                value: controller.rememberMe,
                onChanged: controller.toggleRememberMe,
                side: const BorderSide(color: AppColors.inputBorder),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(_r(4))),
              ),
            ),
            SizedBox(width: _w(8)),
            Expanded(
              child: Text(
                "Remember me",
                style: TextStyle(
                    fontSize: _sp(14), color: AppColors.textSecondary),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Forgot password action
              },
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: _sp(14),
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: _h(24)),

        // LOGIN BUTTON
        CustomButton(
          label: "Login",
          onPressed: controller.login,
          height:
              48, // Keeping fixed height for button often looks better than scaled on desktop
          borderRadius: isMobile ? 30.r : 30,
          isResponsive: isMobile,
        ),

        SizedBox(height: _h(20)),
      ],
    );
  }
}
