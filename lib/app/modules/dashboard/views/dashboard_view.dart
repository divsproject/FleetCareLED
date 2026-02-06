import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                  return const SizedBox.shrink();
                }
                return AppBar(
                  backgroundColor: const Color(0xFF2AA6DF),
                  title: Text(
                    controller.titles[controller.currentIndex.value],
                    style: const TextStyle(color: Colors.white),
                  ),
                  leading: IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: homeController.toggleQuickActions,
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.notifications, color: Colors.red),
                      onPressed: () => Get.toNamed(AppRoutes.NOTIFICATION),
                    ),
                  ],
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
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF2AA6DF),
          unselectedItemColor: Colors.grey,
          onTap: controller.changeTab,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/home 03.svg',
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  controller.currentIndex.value == 0
                      ? const Color(0xFF2AA6DF)
                      : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/direct.svg',
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  controller.currentIndex.value == 1
                      ? const Color(0xFF2AA6DF)
                      : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: "Inbox",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/message.svg',
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  controller.currentIndex.value == 2
                      ? const Color(0xFF2AA6DF)
                      : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: "Message",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/user.svg',
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  controller.currentIndex.value == 3
                      ? const Color(0xFF2AA6DF)
                      : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
