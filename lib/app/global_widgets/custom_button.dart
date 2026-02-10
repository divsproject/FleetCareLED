import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/values/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double height;
  final double borderRadius;
  final bool isOutlined;
  final IconData? icon;
  final bool isLoading;
  final bool isResponsive;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height = 48,
    this.borderRadius = 14,
    this.isOutlined = false,
    this.icon,
    this.isLoading = false,
    this.isResponsive = true,
  }) : super(key: key);

  // Helper methods for conditional responsiveness
  double _r(double val) => isResponsive ? val.r : val;
  double _w(double val) => isResponsive ? val.w : val;
  double _h(double val) => isResponsive ? val.h : val;
  double _sp(double val) => isResponsive ? val.sp : val;

  @override
  Widget build(BuildContext context) {
    if (isOutlined) {
      return SizedBox(
        width: width ?? double.infinity,
        height: _h(height),
        child: OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: backgroundColor ?? AppColors.primary),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_r(borderRadius)),
            ),
          ),
          child: isLoading
              ? SizedBox(
                  width: _w(24),
                  height: _w(24),
                  child: CircularProgressIndicator(
                    strokeWidth: _w(2),
                    valueColor: AlwaysStoppedAnimation<Color>(
                        textColor ?? backgroundColor ?? AppColors.primary),
                  ),
                )
              : _buildContent(
                  textColor ?? backgroundColor ?? AppColors.primary),
        ),
      );
    }

    return SizedBox(
      width: width ?? double.infinity,
      height: _h(height),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_r(borderRadius)),
          ),
          elevation: 0,
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                width: _w(24),
                height: _w(24),
                child: CircularProgressIndicator(
                  strokeWidth: _w(2),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : _buildContent(textColor ?? Colors.white),
      ),
    );
  }

  Widget _buildContent(Color color) {
    if (icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: _sp(20)),
          SizedBox(width: _w(8)),
          Text(
            label,
            style: TextStyle(
              fontSize: _sp(16),
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      );
    }
    return Text(
      label,
      style: TextStyle(
        fontSize: _sp(16),
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }
}
