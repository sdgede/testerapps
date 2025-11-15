import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const BottomNavigation({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.grey,
       type: BottomNavigationBarType.fixed,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Payment'),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Raport'),
        BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
