import 'package:get/get.dart';

class NotificationController extends GetxController {
  // Mock notification data
  final notifications = <NotificationItem>[
    NotificationItem(
      title: "Duty Status Changed",
      message: "Your duty status has been changed to On Duty",
      time: "2 hours ago",
      isRead: false,
    ),
    NotificationItem(
      title: "Vehicle Inspection Due",
      message: "Pre-trip inspection is required before starting your shift",
      time: "5 hours ago",
      isRead: false,
    ),
    NotificationItem(
      title: "HOS Violation Warning",
      message: "You are approaching your 11-hour driving limit",
      time: "1 day ago",
      isRead: true,
    ),
    NotificationItem(
      title: "ELD Malfunction",
      message: "ELD device connection lost. Please check your device",
      time: "2 days ago",
      isRead: true,
    ),
    NotificationItem(
      title: "Log Certified",
      message: "Your daily log for May 15, 2022 has been certified",
      time: "3 days ago",
      isRead: true,
    ),
  ].obs;

  int get unreadCount => notifications.where((n) => !n.isRead).length;

  void markAsRead(int index) {
    notifications[index].isRead = true;
    notifications.refresh();
  }

  void markAllAsRead() {
    for (var notification in notifications) {
      notification.isRead = true;
    }
    notifications.refresh();
  }

  void deleteNotification(int index) {
    notifications.removeAt(index);
  }
}

class NotificationItem {
  String title;
  String message;
  String time;
  bool isRead;

  NotificationItem({
    required this.title,
    required this.message,
    required this.time,
    this.isRead = false,
  });
}
