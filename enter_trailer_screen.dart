import 'package:flutter/material.dart';

class EnterTrailerScreen extends StatelessWidget {
  const EnterTrailerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FD),

      appBar: AppBar(
        backgroundColor: const Color(0xFF2AA6DF),
        elevation: 0,
        title: const Text("Trailer"),
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
                labelText: "Trailer",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
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
                  Navigator.pop(context); // back to Assignment
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
