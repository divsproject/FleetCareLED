import 'package:get/get.dart';
import '../models/log_day_model.dart';

class LogbookController extends GetxController {

  var currentStatus = "Off Duty".obs;
  var totalTime = "546h 00m".obs;

  var selectedIndex = (-1).obs;

  var last14Days = <LogDayModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyData();
  }

  void loadDummyData() {
    for (int i = 0; i < 14; i++) {
      last14Days.add(
        LogDayModel(
          date: "Sat, Oct 18",
          hours: "00h 00m",
          dvir: "No DVIR",
        ),
      );
    }
  }

  void changeStatus(String status) {
    currentStatus.value = status;
  }

  void selectDay(int index) {
    selectedIndex.value = index;

  var isLogBook = true.obs;
   void toggleView(bool value) {
    isLogBook.value = value;
  }
}
}