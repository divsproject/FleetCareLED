import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/logbook_controller.dart';

class LogbookView extends StatelessWidget {
  final LogbookController controller = Get.put(LogbookController());

  LogbookView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Logbook"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// CURRENT STATUS CARD
           Obx(() => Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xffEAF4FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [

          /// 🔵 Icon Circle
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue, width: 2),
              color: Colors.white,
            ),
            child: Icon(
              Icons.power_settings_new,
              color: Colors.blue,
            ),
          ),

          SizedBox(width: 16),

          /// Status Text
          Expanded(
            child: Text(
              controller.currentStatus.value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          /// Total Time
          Text(
            controller.totalTime.value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    )),

            /// CHANGE STATUS GRID
           Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

      Text(
        "Change Status",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),

      Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.blue),
        ),
        child: Text(
          "DR with exception",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
  ),
),

Container(
  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Colors.grey.shade300),
  ),
  child: GridView.count(
    crossAxisCount: 2,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    childAspectRatio: 1.3,
    children: [
      buildStatusItem("Off Duty", Icons.nightlight_round, Colors.red.shade100, Colors.red),
      buildStatusItem("Sleeper Berth", Icons.hotel, Colors.orange.shade100, Colors.orange),
      buildStatusItem("Driving", Icons.local_shipping, Colors.green.shade100, Colors.green),
      buildStatusItem("On Duty", Icons.work_outline, Colors.purple.shade100, Colors.purple),
    ],
  ),
),


            /// LAST 14 DAYS
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Last 14 days",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 10),

                  Obx(() => ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.last14Days.length,
                        itemBuilder: (context, index) {
                          var item = controller.last14Days[index];

                          return ListTile(
                            title: Text(item.date),
                            subtitle: Text(item.hours),
                            trailing: Text(item.dvir),
                            onTap: () {
                              controller.selectDay(index);
                            },
                          );
                        },
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget statusButton(String title) {
    return GestureDetector(
      onTap: () {
        controller.changeStatus(title);
      },
      child: Card(
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
Widget buildStatusItem(
    String title,
    IconData icon,
    Color bgColor,
    Color iconColor,
) {
  return GestureDetector(
    onTap: () {
      var controller;
      controller.changeStatus(title);
    },
    child: Container(
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: Colors.grey.shade300),
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          /// Circle Icon Background
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor,
            ),
            child: Icon(icon, color: iconColor),
          ),

          SizedBox(height: 10),

          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}
