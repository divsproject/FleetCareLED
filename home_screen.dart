import 'package:fleetcare_eld/screens/home/driver-switching_screen.dart/driver_switching_screen.dart';
import 'package:fleetcare_eld/screens/home/dvir/dvir_screen.dart';
import 'package:fleetcare_eld/screens/home/forms/forms_screen.dart';
import 'package:fleetcare_eld/screens/home/fueling/fueling_screen.dart';
import 'package:fleetcare_eld/screens/home/hos/hours_of_service_screen.dart';
import 'package:fleetcare_eld/screens/home/routes/routes_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F7FC),

      // 🔹 APP BAR
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF2AA6DF),
        centerTitle: true,
        title: const Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.settings_outlined),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // 🔹 TOP STATUS CARDS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: _topCard(
                      icon: Icons.power_settings_new,
                      title: "Off Duty",
                      subtitle: "01:07",
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: _topCard(
                      icon: Icons.local_shipping_outlined,
                      title: "Shipping IDs",
                      subtitle: "Vehicle",
                      color: Colors.lightBlue,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // 🔹 QUICK ACTIONS TITLE
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Quick Actions",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 14),

            // 🔹 QUICK ACTION GRID
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                 shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  crossAxisCount: 3,
  mainAxisSpacing: 14,
  crossAxisSpacing: 14,
  children: [

    // HoS
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const HoursOfServiceScreen(),
          ),
        );
      },
      child: const _QuickAction(
        icon: Icons.timer,
        label: "HoS",
        color: Colors.red,
      ),
    ),

    // DVIR
   GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const DVIRScreen(),
      ),
    );
  },
  child: _QuickAction(
    icon: Icons.fact_check,
    label: "DVIR",
    color: Colors.green,
  ),
),


    // Routes
 GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const RoutesScreen(),
      ),
    );
  },
  child: _QuickAction(
    icon: Icons.map_outlined,
    label: "Routes",
    color: Colors.orange,
  ),
),


    // Forms
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
           MaterialPageRoute(
            builder: (_) => const FormsScreen()));

      },
      child: const _QuickAction(
        icon: Icons.assignment,
        label: "Forms",
        color: Colors.pink,
      ),
    ),

    // Documents
    GestureDetector(
      onTap: () {},
      child: const _QuickAction(
        icon: Icons.description,
        label: "Documents",
        color: Colors.purple,
      ),
    ),

    // Vehicle
    GestureDetector(
      onTap: () {},
      child: const _QuickAction(
        icon: Icons.local_shipping,
        label: "Vehicle",
        color: Colors.amber,
      ),
    ),

    // Driving Switching
    GestureDetector(
      onTap: () {
        Navigator.push(context,
  MaterialPageRoute(builder: (_) => const DriverSwitchingScreen()));
      },
      child: const _QuickAction(
        icon: Icons.swap_horiz,
        label: "Driving\nSwitching",
        color: Colors.indigo,
      ),
    ),

    // Fuelling
    GestureDetector(
      onTap: () {
        Navigator.push(context,
  MaterialPageRoute(builder: (_) => FuelingScreen()));
      },
      child: const _QuickAction(
        icon: Icons.local_gas_station,
        label: "Fuelling",
        color: Colors.teal,
      ),
    ),

    // More
    GestureDetector(
      onTap: () {},
      child: const _QuickAction(
        icon: Icons.more_horiz,
        label: "More",
        color: Colors.blueGrey,
      ),
    ),
  ],
),

            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // 🔹 TOP CARD
  Widget _topCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 22),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: color.withOpacity(0.25),
            child: Icon(icon, color: color),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

// 🔹 QUICK ACTION TILE
class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _QuickAction({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: color.withOpacity(0.18),
            child: Icon(icon, size: 20, color: color),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
