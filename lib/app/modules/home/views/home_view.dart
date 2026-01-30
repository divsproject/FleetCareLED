import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/duty_status.dart';
import '../../../core/values/app_colors.dart';
import '../controllers/home_controller.dart';
// Note: Imports for sub-screens will be added as they are migrated
// import 'hos/hours_of_service_screen.dart';
// import 'dvir/dvir_screen.dart';
// ...

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,

          // 🔵 APP BAR
          appBar: AppBar(
            backgroundColor: const Color(0xFF2AA6DF),
            title: const Text("Home Screen",
                style: TextStyle(color: Colors.white)),
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: controller.toggleQuickActions,
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.notifications, color: Colors.red),
              ),
            ],
          ),

          // 🔵 BODY
          body: Stack(
            children: [
              Column(
                children: [
                  // USER + VEHICLE
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.person, size: 18),
                            SizedBox(width: 6),
                            Text(
                              "user",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),

                        // 🚚 VEHICLE CLICK
                        InkWell(
                          onTap: () =>
                              _openChangeEquipment(context, controller),
                          child: Row(
                            children: [
                              const Icon(Icons.local_shipping),
                              const SizedBox(width: 4),
                              Obx(() => Text(controller.vehicleNumber.value)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // ⏱ TIMER
                  SizedBox(
                    height: 200,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 180,
                          height: 180,
                          child: CircularProgressIndicator(
                            value: 0.75,
                            strokeWidth: 10,
                            color: Colors.grey.shade700,
                            backgroundColor: Colors.grey.shade200,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "14:00",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text("REMAINING"),
                            const SizedBox(height: 6),

                            // Status Chip using Obx
                            Obx(
                              () => InkWell(
                                onTap: () =>
                                    _openChangeStatus(context, controller),
                                child: Chip(
                                  label: Text(
                                    controller.currentStatus.value.name
                                        .toUpperCase(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: controller.getStatusColor(
                                    controller.currentStatus.value,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // ⭕ CIRCLES
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    padding: const EdgeInsets.all(24),
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    children: const [
                      _CircleInfo("8:00", "BREAK", Colors.amber),
                      _CircleInfo("11:00", "DRIVING", Colors.green),
                      _CircleInfo("14:00", "SHIFT", Colors.black),
                      _CircleInfo("70:00", "CYCLE", Colors.blue),
                    ],
                  ),
                ],
              ),

              // DIM Overlay
              Obx(
                () => controller.showQuickActions.value
                    ? Positioned.fill(
                        child: GestureDetector(
                          onTap: controller.closeQuickActions,
                          child:
                              Container(color: Colors.black.withOpacity(0.25)),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),

              // LEFT PANEL (DRAWER)
              Obx(
                () => AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  left: controller.showQuickActions.value ? 0 : -280,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 280,
                    color: const Color(0xFF1F1F1F),
                    child: SafeArea(
                      child: ListView(
                        padding: const EdgeInsets.all(12),
                        children: [
                          _tile(Icons.timer, "HoS", () {
                            controller.closeQuickActions();
                            // Get.toNamed(AppRoutes.HOS); // TODO: Implement route
                          }),
                          _tile(Icons.assignment, "DVIR", () {
                            // Get.toNamed(AppRoutes.DVIR);
                          }),
                          _tile(Icons.alt_route, "Routes", () {
                            // Get.toNamed(AppRoutes.ROUTES);
                          }),
                          _tile(Icons.description, "Forms", () {
                            // Get.toNamed(AppRoutes.FORMS);
                          }),
                          _tile(Icons.local_gas_station, "Fueling", () {
                            // Get.toNamed(AppRoutes.FUELING);
                          }),
                          _tile(Icons.folder, "Document", () {}),
                          _tile(Icons.local_shipping, "Vehicle", () {}),
                          _tile(Icons.swap_horiz, "Driving", () {}),
                          _tile(Icons.settings, "Settings", () {}),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // 🔵 BOTTOM NAV
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: const Color(0xFF2AA6DF),
              unselectedItemColor: Colors.grey,
              onTap: controller.changeTab,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.inbox), label: "Inbox"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: "Message",
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile"),
              ],
            ),
          ),
        );
      },
    );
  }

  // 🔽 CHANGE EQUIPMENT MODAL
  void _openChangeEquipment(BuildContext context, HomeController controller) {
    controller.vehicleController.text = controller.vehicleNumber.value;
    controller.trailerController.clear();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            16,
            20,
            16,
            MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Change Equipment",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: controller.vehicleController,
                decoration: const InputDecoration(labelText: "Vehicle"),
              ),
              TextField(
                controller: controller.trailerController,
                decoration: const InputDecoration(labelText: "Trailer"),
              ),
              TextButton(
                onPressed: controller.addTrailer,
                child: const Text("Add Trailer"),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: controller.updateVehicle,
                  child: const Text("Save"),
                ),
              ),
              TextButton(
                onPressed: () => Get.back(),
                child: const Text("Cancel"),
              ),
            ],
          ),
        );
      },
    );
  }

  // 🔽 OPEN CHANGE STATUS MODAL
  void _openChangeStatus(BuildContext context, HomeController controller) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Change Status",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                // STATUS GRID
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    _statusTile(
                      "OFF",
                      "OFF DUTY",
                      Colors.red,
                      DutyStatus.offDuty,
                      controller,
                    ),
                    _statusTile(
                      "SB",
                      "SLEEPER",
                      Colors.blue,
                      DutyStatus.sleeper,
                      controller,
                    ),
                    _statusTile(
                      "ON",
                      "ON DUTY",
                      Colors.green,
                      DutyStatus.onDuty,
                      controller,
                    ),
                    _statusTile(
                      "D",
                      "DRIVING",
                      Colors.orange,
                      DutyStatus.driving,
                      controller,
                    ),
                    _statusTile(
                        "Y", "YARD", Colors.grey, DutyStatus.yard, controller),
                    _statusTile(
                      "P",
                      "PERSONAL",
                      Colors.purple,
                      DutyStatus.personal,
                      controller,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // ADD NOTE
                Obx(
                  () => ListTile(
                    title: const Text("Add Note"),
                    subtitle: Text(controller.selectedNote.value),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () async {
                      // Navigate to note selection screen
                      // final note = await Get.to(() => SelectNoteScreen());
                      // if (note != null) controller.updateNote(note);
                    },
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    child: const Text("Update"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _statusTile(
    String short,
    String label,
    Color color,
    DutyStatus status,
    HomeController controller,
  ) {
    return Obx(() {
      final bool isSelected = controller.currentStatus.value == status;
      return InkWell(
        onTap: () => controller.updateStatus(status),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? color.withOpacity(0.15) : Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected ? color : Colors.grey.shade300,
              width: 1.5,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: isSelected ? color : Colors.grey.shade300,
                child: Text(
                  short,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? color : Colors.black54,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _tile(IconData icon, String label, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(label, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

class _CircleInfo extends StatelessWidget {
  final String time;
  final String label;
  final Color color;

  const _CircleInfo(this.time, this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 6),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              time,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
