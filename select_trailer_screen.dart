import 'package:flutter/material.dart';

class SelectTrailerScreen extends StatefulWidget {
  const SelectTrailerScreen({super.key});

  @override
  State<SelectTrailerScreen> createState() => _SelectTrailerScreenState();
}

class _SelectTrailerScreenState extends State<SelectTrailerScreen> {
  final List<String> trailers = [
    "TR-101A",
    "TR-102B",
    "TR-103C",
    "TR-104D",
    "TR-105E",
  ];

  final Set<String> selectedTrailers = {"TR-101A"};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Trailer(s)"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // 🔍 Search
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
          _trailerTile("TR-101A", subtitle: "Last Selected"),

          _sectionTitle("Other Trailers"),

          Expanded(
            child: ListView.builder(
              itemCount: trailers.length,
              itemBuilder: (context, index) {
                return _trailerTile(trailers[index]);
              },
            ),
          ),

          // DONE
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
                  Navigator.pop(context, selectedTrailers.toList());
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

  Widget _trailerTile(String trailer, {String? subtitle}) {
    final bool isSelected = selectedTrailers.contains(trailer);

    return ListTile(
      title: Text(trailer),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: isSelected
          ? const Icon(Icons.check_circle, color: Colors.blue)
          : null,
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedTrailers.remove(trailer);
          } else {
            selectedTrailers.add(trailer);
          }
        });
      },
    );
  }
}
