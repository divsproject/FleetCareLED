import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/assignment_controller.dart';
import '../../../routes/app_routes.dart';

class SelectShippingView extends StatelessWidget {
  const SelectShippingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssignmentController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Select Shipping ID(s)"),
            backgroundColor: Colors.blue,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Get.back(),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: controller.navigateToManualShipping,
              )
            ],
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
              _shippingTile("SHIP-12045", controller,
                  subtitle: "Last Selected"),

              _sectionTitle("Other Shipping IDs"),

              Expanded(
                child: ListView.builder(
                  itemCount: controller.shippingIds.length,
                  itemBuilder: (context, index) {
                    return _shippingTile(
                        controller.shippingIds[index], controller);
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

  Widget _shippingTile(String id, AssignmentController controller,
      {String? subtitle}) {
    final bool isSelected = controller.selectedShippingIds.contains(id);

    return ListTile(
      title: Text(id),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: isSelected
          ? const Icon(Icons.check_circle, color: Colors.blue)
          : null,
      onTap: () {
        controller.toggleShippingId(id);
      },
    );
  }
}
