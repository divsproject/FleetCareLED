import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/assignment_controller.dart';
import '../../../routes/app_routes.dart';

class SelectTrailerView extends StatelessWidget {
  const SelectTrailerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssignmentController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Select Trailer(s)"),
            backgroundColor: Colors.blue,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Get.back(),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: controller.navigateToManualTrailer,
              )
            ],
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
              _trailerTile("TR-101A", controller, subtitle: "Last Selected"),

              _sectionTitle("Other Trailers"),

              Expanded(
                child: ListView.builder(
                  itemCount: controller.trailers.length,
                  itemBuilder: (context, index) {
                    return _trailerTile(controller.trailers[index], controller);
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
                      Get.back();
                    },
                    child: const Text("Done",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
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

  Widget _trailerTile(String trailer, AssignmentController controller,
      {String? subtitle}) {
    final bool isSelected = controller.selectedTrailers.contains(trailer);

    return ListTile(
      title: Text(trailer),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: isSelected
          ? const Icon(Icons.check_circle, color: Colors.blue)
          : null,
      onTap: () {
        controller.toggleTrailer(trailer);
      },
    );
  }
}
