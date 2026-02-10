import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/values/app_constants.dart';

class ResponsiveWrapper extends StatelessWidget {
  final Widget child;

  const ResponsiveWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Using contentWidth (570) as the breakpoint/max-width for mobile layout
        if (constraints.maxWidth > contentWidth) {
          // Tablet / Web View
          return Container(
            color: const Color(0xFFF5F5F5), // Light grey background
            alignment: Alignment.center,
            child: Container(
              width: contentWidth, // Constrain width to 570px
              height: constraints.maxHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRect(
                child: MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    size: Size(contentWidth, constraints.maxHeight),
                  ),
                  child: ScreenUtilInit(
                    designSize: const Size(375, 812), // Mobile design size
                    minTextAdapt: true,
                    splitScreenMode: true,
                    builder: (context, _) => child,
                  ),
                ),
              ),
            ),
          );
        }

        // Mobile View
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, _) => child,
        );
      },
    );
  }
}
