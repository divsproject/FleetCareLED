import 'package:flutter/material.dart';

class SelectVehicleScreen extends StatefulWidget {
  const SelectVehicleScreen({super.key});

  @override
  State<SelectVehicleScreen> createState() => _SelectVehicleScreenState();
}

class _SelectVehicleScreenState extends State<SelectVehicleScreen> {
  String selectedVehicle = "305";

  final List<String> otherVehicles = [
    "302",
    "303",
    "304",
    "305",
    "306",
    "307",
    "308",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Vehicle"),
        backgroundColor: Colors.blue,
      ),

      body: Column(
        children: [
          // 🔍 Search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search here...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Suggested
          _sectionTitle("Suggested (1)"),

          _vehicleTile(
            vehicleNo: "305",
            subtitle: "Last Selected",
          ),

          _sectionTitle("Other Vehicles (${otherVehicles.length})"),

          Expanded(
            child: ListView.builder(
              itemCount: otherVehicles.length,
              itemBuilder: (context, index) {
                return _vehicleTile(
                  vehicleNo: otherVehicles[index],
                );
              },
            ),
          ),

          // DONE button
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, selectedVehicle);
                },
                child: const Text("Done"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Section title
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  // 🔹 Vehicle tile
  Widget _vehicleTile({
    required String vehicleNo,
    String? subtitle,
  }) {
    final bool isSelected = selectedVehicle == vehicleNo;

    return ListTile(
      title: Text("Vehicle $vehicleNo"),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: isSelected
          ? const Icon(Icons.check_circle, color: Colors.blue)
          : null,
      onTap: () {
        setState(() {
          selectedVehicle = vehicleNo;
        });
      },
    );
  }
}
