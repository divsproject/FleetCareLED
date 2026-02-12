import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/values/app_colors.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? customTitle;
  final Color? bgColor;
  final Color? titleColor;
  final bool showBackButton;
  final Widget? leading;
  final List<Widget>? actions;
  final VoidCallback? onLeadingPressed;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    Key? key,
    this.title = "",
    this.customTitle,
    this.bgColor,
    this.titleColor,
    this.showBackButton = true,
    this.leading,
    this.actions,
    this.onLeadingPressed,
    this.centerTitle = true,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor ?? AppColors.primary,
      elevation: 0,
      centerTitle: centerTitle,
      leading: leading ??
          (showBackButton
              ? IconButton(
                  icon: Icon(Icons.arrow_back,
                      color: titleColor ?? Colors.white, size: 24.spMin),
                  onPressed: onLeadingPressed ?? () => Get.back(),
                )
              : null),
      title: customTitle ??
          CustomText(
            title,
            color: titleColor ?? Colors.white,
            fontSize: 18.spMin, // Fixed size for tablet optimization
            fontWeight: FontWeight.w600,
          ),
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}
