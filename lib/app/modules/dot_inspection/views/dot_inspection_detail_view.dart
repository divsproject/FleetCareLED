import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global_widgets/custom_text.dart';
import '../../../global_widgets/custom_app_bar.dart';
import '../controllers/dot_inspection_controller.dart';

class DotInspectionDetailView extends GetView<DotInspectionController> {
  const DotInspectionDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "DOT Inspection Mode",
        actions: [
          IconButton(
            icon: Icon(Icons.edit_outlined, color: Colors.white, size: 24.sp),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 12.h, bottom: 12.h, left: 12.w, right: 12.w),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
          ),
          padding: EdgeInsets.only(top: 8.h, bottom: 8.h, left: 8.w, right: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(),
              Divider(thickness: 1, color: Colors.black),

              // Info Grid
              _buildInfoGrid(),
              Divider(thickness: 1, color: Colors.black),

              // Graph
              SizedBox(height: 16.h),
              _buildGraphSection(),
              SizedBox(height: 16.h),

              // Event Table
              _buildEventTable(),
              SizedBox(height: 16.h),

              // Recap Table (Mock)
              _buildRecapTable(),
              SizedBox(height: 16.h),

              // Signature
              Center(
                child: Column(
                  children: [
                    CustomText(
                        "I hereby certify that my data entries and my record of duty status for this day are true and correct",
                        fontSize: 13.spMin,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center),
                    SizedBox(height: 16.h),
                    // Mock Signature
                    Icon(Icons.draw, size: 30.sp, color: Colors.black54),
                    Container(height: 1, width: 150.w, color: Colors.black),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText("FleetCare",
            fontWeight: FontWeight.bold, fontSize: 18.spMin, color: Colors.black),
        Column(
          children: [
            CustomText("DRIVER'S DAILY LOG",
                fontWeight: FontWeight.bold, fontSize: 16.spMin),
            CustomText("USA Property 70 hour / 8 day", fontSize: 13.spMin),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomText("Log Date: May 15, 2022", fontSize: 12.spMin),
            CustomText("Print Date: May 17, 2022", fontSize: 12.spMin),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoGrid() {
    return Column(
      children: [
        _buildInfoRow(
            "Driver", "Stephens, Adam  ID: adam.stephens", "Co-Drivers", ""),
        _buildInfoRow("Fleet ID", "", "Exempt Driver", "0"),
        _buildInfoRow("Driver License", "14298y1, CA", "Vehicle License", ""),
        _buildInfoRow("Distance", "", "Engine Hours", ""),
        _buildInfoRow("Odometers", "", "Shipping Docs", ""),
        _buildInfoRow("Current Location", "", "24-Period Starting", "Midnight"),
        _buildInfoRow(
            "Data Diag. Indicators", "No", "ELD Malfn. Indicators", "No"),
        _buildInfoRow(
            "ELD ID", "MOTIVE", "ELD Provider", "Motive Technologies Inc"),
        _buildInfoRow("Vehicles and VINs", "", "", ""),
        _buildInfoRow("Trailers", "", "", ""),
        _buildInfoRow(
            "Carrier and DOT#", "MARINE DOCK & LIFT (3244526)", "", ""),
        _buildInfoRow(
            "Main Office", "410 GRAND AVE, CENTER CITY, MN, 55012", "", ""),
      ],
    );
  }

  Widget _buildInfoRow(
      String label1, String value1, String label2, String value2) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black26)),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 112.w,
                    padding:
                        EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
                    child: CustomText(label1,
                        fontSize: 12.spMin, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
                      decoration: BoxDecoration(
                          border:
                              Border(left: BorderSide(color: Colors.black26))),
                      child: CustomText(value1, fontSize: 12.spMin),
                    ),
                  ),
                ],
              ),
            ),
            Container(width: 1, color: Colors.black26),
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 112.w,
                    padding:
                        EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
                    child: CustomText(label2,
                        fontSize: 12.spMin, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
                      decoration: BoxDecoration(
                          border:
                              Border(left: BorderSide(color: Colors.black26))),
                      child: CustomText(value2, fontSize: 12.spMin),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGraphSection() {
    return Column(
      children: [
        _buildGraphRow("OFF", 24.00),
        _buildGraphRow("SB", 00.00),
        _buildGraphRow("D", 00.00),
        _buildGraphRow("ON", 00.00),
      ],
    );
  }

  Widget _buildGraphRow(String label, double hours) {
    return Row(
      children: [
        SizedBox(
            width: 40.w,
            child: Text(label,
                textAlign: TextAlign.right, style: TextStyle(fontSize: 12.spMin))),
        SizedBox(width: 8.w),
        Expanded(
          child: Container(
              height: 16.h,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: label == "OFF" ? Colors.grey[300] : Colors.white),
              // Placeholder for actual grid lines
              child: Row(
                  children: List.generate(
                      24,
                      (index) => Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Colors.grey[300]!)))))))),
        ),
        SizedBox(width: 8.w),
        SizedBox(
            width: 40.w,
            child: Text(hours.toStringAsFixed(2),
                style: TextStyle(fontSize: 12.spMin))),
      ],
    );
  }

  Widget _buildEventTable() {
    return Table(
      border: TableBorder.all(color: Colors.black),
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(3),
        3: FlexColumnWidth(2),
        4: FlexColumnWidth(3),
        5: FlexColumnWidth(2),
        6: FlexColumnWidth(2),
        7: FlexColumnWidth(2),
        8: FlexColumnWidth(2),
      },
      children: [
        _buildTableRow([
          "No.",
          "Status",
          "Start",
          "Duration",
          "Location",
          "Engine",
          "Odo",
          "CMV",
          "Notes"
        ], isHeader: true),
        _buildTableRow([
          "1",
          "Off Duty",
          "12:00:00 AM",
          "24 hr",
          "Nashville, TN",
          "",
          "",
          "",
          "Off Duty"
        ]),
        _buildTableRow(
            ["2", "Cert", "May 16 12:05 PM", "-", "", "", "", "", ""]),
      ],
    );
  }

  TableRow _buildTableRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      decoration:
          BoxDecoration(color: isHeader ? Colors.grey[200] : Colors.white),
      children: cells
          .map((cell) => Padding(
                padding: EdgeInsets.only(top: 4.h, bottom: 4.h, left: 4.w, right: 4.w),
                child: Text(cell,
                    style: TextStyle(
                        fontSize: 10.spMin,
                        fontWeight:
                            isHeader ? FontWeight.bold : FontWeight.normal)),
              ))
          .toList(),
    );
  }

  Widget _buildRecapTable() {
    return Column(
      children: [
        CustomText("Recap", fontWeight: FontWeight.bold),
        Table(
          border: TableBorder.all(color: Colors.black),
          children: [
            _buildTableRow(
                ["5/08", "5/09", "5/10", "5/11", "5/12", "5/13", "5/14"],
                isHeader: true),
            _buildTableRow(
                ["0.00", "0.00", "0.00", "14.47", "10.67", "24.00", "16.00"]),
          ],
        ),
      ],
    );
  }
}
