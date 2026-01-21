import 'package:fleetcare_eld/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class EnterShippingIdScreen extends StatelessWidget {
  const EnterShippingIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FD),

      appBar: AppBar(
        backgroundColor: const Color(0xFF2AA6DF),
        elevation: 0,
        title: const Text("Shipping ID"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔹 Input
            TextField(
              decoration: InputDecoration(
                labelText: "Shipping ID",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // 🔹 Suggestion
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Suggestions\nHello",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
            ),

            const Spacer(),

            // 🔹 Save Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2AA6DF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                },
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


