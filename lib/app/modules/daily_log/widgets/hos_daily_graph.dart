import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../global_widgets/custom_text.dart';

class HosDailyGraph extends StatelessWidget {
  const HosDailyGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🕒 Time Markers (Top Row)
        Padding(
          padding: EdgeInsets.only(
              left: 40.w, right: 40.w, bottom: 4.h), // Align with grid
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTimeLabel("M"),
              ...List.generate(11, (index) => _buildTimeLabel("${index + 1}")),
              _buildTimeLabel("N", fontWeight: FontWeight.bold),
              ...List.generate(11, (index) => _buildTimeLabel("${index + 1}")),
              _buildTimeLabel("M"),
            ],
          ),
        ),

        // 📊 The Main Chart Grid
        Container(
          height: 200.h, // Fixed height for the chart area
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: Row(
            children: [
              // 🏷 Left Labels (OFF, SB, DR, ON)
              SizedBox(
                width: 40.w,
                child: Column(
                  children: [
                    _buildSideLabel("OFF", border: true),
                    _buildSideLabel("SB"),
                    _buildSideLabel("DR"),
                    _buildSideLabel("ON"),
                  ],
                ),
              ),

              // 🕸 The Grid (Custom Painter)
              Expanded(
                child: Stack(
                  children: [
                    // Background Colors for rows
                    Column(
                      children: [
                        _buildRowBackground(color: Colors.white, border: true),
                        _buildRowBackground(color: Colors.white),
                        _buildRowBackground(color: const Color(0xFFF1F8E9)),
                        _buildRowBackground(color: const Color(0xFFF3E5F5)),
                      ],
                    ),
                    // The Grid Lines
                    CustomPaint(
                      size: Size.infinite,
                      painter: _GridPainter(),
                    ),
                  ],
                ),
              ),

              // 🔢 Right Totals (15.50, 00.00 ...)
              SizedBox(
                width: 40.w,
                child: Column(
                  children: [
                    _buildSideLabel("15.50", border: true),
                    _buildSideLabel("00.00"),
                    _buildSideLabel("00.00"),
                    _buildSideLabel("00.00"),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Final Total at bottom right
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(top: 8.h, right: 8.w),
            child: CustomText("15.75",
                fontWeight: FontWeight.bold, fontSize: 13.spMin),
          ),
        )
      ],
    );
  }

  Widget _buildTimeLabel(String text,
      {FontWeight fontWeight = FontWeight.normal}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 10.spMin,
        color: Colors.black,
        fontWeight: fontWeight,
      ),
    );
  }

  Widget _buildSideLabel(String text, {bool border = false}) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade300),
            right: border
                ? BorderSide.none
                : BorderSide(color: Colors.grey.shade300),
            left: border
                ? BorderSide.none
                : BorderSide(color: Colors.grey.shade300), // Separate borders
          ),
        ),
        child: CustomText(
          text,
          fontSize: 12.spMin,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildRowBackground({required Color color, bool border = false}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: border
              ? Border.all(color: Colors.blue, width: 2) // Selected Row Border
              : Border(bottom: BorderSide(color: Colors.grey.shade300)),
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1;

    final tickPaint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 1;

    // We have 24 hours.
    double stepX = size.width / 24;

    // Draw Vertical Lines
    for (int i = 0; i <= 24; i++) {
      double x = i * stepX;
      // Full hour line
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);

      // Draw Quarter Ticks (15, 30, 45 min)
      if (i < 24) {
        double quarterStep = stepX / 4;
        for (int j = 1; j < 4; j++) {
          double qX = x + (j * quarterStep);
          // Small ticks, maybe mostly invisible or just small vertical dashes?
          // The image shows full vertical lines that are very faint,
          // and maybe shorter ones? Let's assume faint full lines for simpler visual or just tick marks.
          // The image actually shows full grid lines for sub-hours closely.
          // Let's draw shorter ticks at the top of each row to keep it clean.

          double rowHeight = size.height / 4;
          for (int r = 0; r < 4; r++) {
            double y = r * rowHeight;
            canvas.drawLine(
                Offset(qX, y), Offset(qX, y + rowHeight * 0.3), tickPaint);
          }
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
