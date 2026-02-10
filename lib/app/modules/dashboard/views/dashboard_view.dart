import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../home/views/home_view.dart';
import '../../home/views/home_drawer.dart';
import '../../home/controllers/home_controller.dart';
import '../../edit_profile/views/edit_profile_view.dart';
import '../controllers/dashboard_controller.dart';
import '../../../routes/app_routes.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ensure HomeController is found for Drawer and HomeView
    // It's lazyPut in DashboardBinding, so accessing it via Get.find() if needed,
    // but HomeView and HomeDrawer use GetBuilder/GetView so they should find it.
    final homeController = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: Colors.white,

      // 🔵 BODY - AppBar is moved here to allow full hiding
      body: Stack(
        children: [
          Column(
            children: [
              // 🔵 CUSTOM APP BAR LOGIC
              Obx(() {
                if (controller.currentIndex.value == 3) {
                  return SizedBox.shrink();
                }
                return Container(
                  color: const Color(0xFF2AA6DF),
                  padding: EdgeInsets.only(
                    top: 50.h, // Responsive top padding
                    left: 16.w, // Responsive left padding
                    right: 16.w, // Responsive right padding
                    bottom: 16.h, // Responsive bottom padding
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.menu,
                            color: Colors.white,
                            size: 24.sp), // Responsive icon
                        onPressed: homeController.toggleQuickActions,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      Text(
                        controller.titles[controller.currentIndex.value],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp, // Responsive font
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.notifications,
                            color: Colors.red, size: 24.sp), // Responsive icon
                        onPressed: () => Get.toNamed(AppRoutes.NOTIFICATION),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                );
              }),

              // 🔵 MAIN CONTENT
              Expanded(
                child: Obx(() {
                  switch (controller.currentIndex.value) {
                    case 0:
                      // HomeView now contains just the gauges/timers
                      return const HomeView();
                    case 3:
                      return const EditProfileView();
                    default:
                      return Center(
                          child: Text(
                              "${controller.titles[controller.currentIndex.value]} Coming Soon"));
                  }
                }),
              ),
            ],
          ),

          // DIM Overlay
          Obx(
            () => homeController.showQuickActions.value
                ? Positioned.fill(
                    child: GestureDetector(
                      onTap: homeController.closeQuickActions,
                      child: Container(color: Colors.black.withOpacity(0.25)),
                    ),
                  )
                : const SizedBox.shrink(),
          ),

          // LEFT PANEL (DRAWER)
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              left: homeController.showQuickActions.value ? 0 : -280,
              top: 0,
              bottom: 0,
              child: HomeDrawer(controller: homeController),
            ),
          ),
        ],
      ),

      // 🔵 BOTTOM NAV
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10.r, // Responsive radius
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: const Color(0xFF2AA6DF),
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(
              fontSize: 12.sp, // Responsive font
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 12.sp, // Responsive font
              fontWeight: FontWeight.w500,
            ),
            onTap: controller.changeTab,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.h), // Responsive padding
                  child: SvgPicture.asset(
                    'assets/icons/home 03.svg',
                    width: 24.w, // Responsive width
                    height: 24.h, // Responsive height
                    colorFilter: ColorFilter.mode(
                      controller.currentIndex.value == 0
                          ? const Color(0xFF2AA6DF)
                          : Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: SvgPicture.asset(
                    'assets/icons/direct.svg',
                    width: 24.w,
                    height: 24.h,
                    colorFilter: ColorFilter.mode(
                      controller.currentIndex.value == 1
                          ? const Color(0xFF2AA6DF)
                          : Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                label: "Inbox",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: SvgPicture.asset(
                    'assets/icons/message.svg',
                    width: 24.w,
                    height: 24.h,
                    colorFilter: ColorFilter.mode(
                      controller.currentIndex.value == 2
                          ? const Color(0xFF2AA6DF)
                          : Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                label: "Message",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: SvgPicture.asset(
                    'assets/icons/user.svg',
                    width: 24.w,
                    height: 24.h,
                    colorFilter: ColorFilter.mode(
                      controller.currentIndex.value == 3
                          ? const Color(0xFF2AA6DF)
                          : Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
