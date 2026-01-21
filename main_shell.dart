import 'package:flutter/material.dart';

class MainBottomBar extends StatelessWidget {
  final int current;
  const MainBottomBar({super.key, required this.current});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: current,
      selectedItemColor: const Color(0xFF2AA6DF),
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: "Message",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.inbox),
          label: "Inbox",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "You",
        ),
      ],
    );
  }
}
