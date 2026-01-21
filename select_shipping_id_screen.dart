import 'package:flutter/material.dart';

class SelectShippingIdScreen extends StatefulWidget {
  const SelectShippingIdScreen({super.key});

  @override
  State<SelectShippingIdScreen> createState() => _SelectShippingIdScreenState();
}

class _SelectShippingIdScreenState extends State<SelectShippingIdScreen> {
  final List<String> shippingIds = [
    "SHIP-12045",
    "SHIP-12046",
    "SHIP-12047",
    "SHIP-12048",
    "SHIP-12049",
  ];

  final Set<String> selectedIds = {"SHIP-12045"};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Shipping ID(s)"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Search
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

          _sectionTitle("Suggested (1)"),
          _shippingTile("SHIP-12045", subtitle: "Last Selected"),

          _sectionTitle("Other Shipping IDs"),

          Expanded(
            child: ListView.builder(
              itemCount: shippingIds.length,
              itemBuilder: (context, index) {
                return _shippingTile(shippingIds[index]);
              },
            ),
          ),

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
                  Navigator.pop(context, selectedIds.toList());
                },
                child: const Text("Done"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget _shippingTile(String id, {String? subtitle}) {
    final bool isSelected = selectedIds.contains(id);

    return ListTile(
      title: Text(id),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing:
          isSelected ? const Icon(Icons.check_circle, color: Colors.blue) : null,
      onTap: () {
        setState(() {
          isSelected ? selectedIds.remove(id) : selectedIds.add(id);
        });
      },
    );
  }
}
