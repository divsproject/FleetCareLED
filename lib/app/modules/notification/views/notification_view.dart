import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_text.dart';
import '../../../global_widgets/custom_app_bar.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Notifications",
        actions: [
          Obx(() => controller.unreadCount > 0
              ? TextButton(
                  onPressed: controller.markAllAsRead,
                  child: CustomText(
                    "Mark all read",
                    color: Colors.white,
                    fontSize: 14.spMin,
                  ),
                )
              : const SizedBox()),
        ],
      ),
      body: Obx(() {
        if (controller.notifications.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.notifications_none,
                    size: 80.sp, color: Colors.grey[300]),
                SizedBox(height: 16.h),
                CustomText(
                  "No notifications",
                  fontSize: 16.spMin,
                  color: Colors.grey[600],
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          padding: EdgeInsets.zero,
          itemCount: controller.notifications.length,
          separatorBuilder: (context, index) =>
              Divider(height: 1, color: Colors.grey[200]),
          itemBuilder: (context, index) {
            final notification = controller.notifications[index];
            return Dismissible(
              key: Key(notification.title + index.toString()),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20.w),
                child: Icon(Icons.delete, color: Colors.white, size: 24.sp),
              ),
              onDismissed: (direction) {
                controller.deleteNotification(index);
                Get.snackbar(
                  "Deleted",
                  "Notification removed",
                  snackPosition: SnackPosition.BOTTOM,
                  duration: Duration(seconds: 2),
                );
              },
              child: InkWell(
                onTap: () => controller.markAsRead(index),
                child: Container(
                  color: notification.isRead ? Colors.white : Colors.blue[50],
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 4.h, right: 12.w),
                        width: 10.r,
                        height: 10.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: notification.isRead
                              ? Colors.transparent
                              : AppColors.primary,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              notification.title,
                              fontSize: 16.spMin,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            SizedBox(height: 4.h),
                            CustomText(
                              notification.message,
                              fontSize: 15.spMin,
                              color: Colors.grey[700],
                            ),
                            SizedBox(height: 8.h),
                            CustomText(
                              notification.time,
                              fontSize: 14.spMin,
                              color: Colors.grey[500],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
