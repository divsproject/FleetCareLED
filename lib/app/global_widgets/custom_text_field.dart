import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/values/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final IconData? icon;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final bool isPassword;
  final VoidCallback? onTogglePassword;
  final bool isResponsive;

  const CustomTextField({
    Key? key,
    this.label,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.icon,
    this.keyboardType,
    this.onChanged,
    this.validator,
    this.isPassword = false,
    this.onTogglePassword,
    this.isResponsive = true,
  }) : super(key: key);

  // Helper methods
  double _r(double val) => isResponsive ? val.r : val;
  double _w(double val) => isResponsive ? val.w : val;
  double _h(double val) => isResponsive ? val.h : val;
  double _sp(double val) => isResponsive ? val.spMin : val;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: TextStyle(
              fontSize: _sp(14),
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: _h(6)),
        ],
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          onChanged: onChanged,
          validator: validator,
          style: TextStyle(
            fontSize: _sp(15), // Responsive font
            color: AppColors.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: AppColors.textHint, fontSize: _sp(15)),
            suffixIcon: suffixIcon ??
                (isPassword
                    ? IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                          size: _sp(20),
                          color: Colors.grey,
                        ),
                        onPressed: onTogglePassword,
                      )
                    : null),
            prefixIcon: prefixIcon ??
                (icon != null
                    ? Icon(icon, size: _sp(20), color: Colors.grey)
                    : null),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
                horizontal: _w(16), vertical: _h(12)), // Responsive padding
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(_r(10)), // Responsive radius
              borderSide: const BorderSide(color: AppColors.inputBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(_r(10)),
              borderSide: const BorderSide(color: AppColors.inputBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(_r(10)),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            errorStyle: TextStyle(fontSize: _sp(12)),
          ),
        ),
      ],
    );
  }
}
