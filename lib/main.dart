import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'app/routes/app_pages.dart';
import 'app/core/values/app_colors.dart';
import 'app/services/driver_service.dart';

import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Get.putAsync(() async => DriverService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Note: ResponsiveSizer adapts automatically to any screen size using percentages.
    // Unlike ScreenUtil, it does not require a fixed design reference size (e.g. 440x956).
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ResponsiveSizer(
          builder: (context, orientation, screenType) {
            return GetMaterialApp(
              title: 'FleetCare ELD',
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: AppColors.primary,
                scaffoldBackgroundColor: Colors.white,
                fontFamily: 'Roboto', // Assuming default font
                colorScheme: ColorScheme.fromSwatch().copyWith(
                  primary: AppColors.primary,
                  secondary: AppColors.primaryLight,
                ),
              ),
              defaultTransition: Transition.fadeIn,
            );
          },
        );
      },
    );
  }
}
