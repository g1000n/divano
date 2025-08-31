import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onTap; // callback for navigation

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const navColor = Color(0xFFD8FF76);

    return BottomNavigationBar(
      backgroundColor: const Color(0xFF222531),
      selectedItemColor: navColor,
      unselectedItemColor: navColor.withOpacity(0.45),
      currentIndex: selectedIndex,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/home_icon.png',
            height: 40,
            width: 40,
            color: selectedIndex == 0 ? navColor : navColor.withOpacity(0.45),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/logistics_icon.png',
            height: 45,
            width: 45,
            color: selectedIndex == 1 ? navColor : navColor.withOpacity(0.45),
          ),
          label: 'Logistics',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/qr_icon.png',
            height: 60,
            width: 60,
            color: selectedIndex == 2 ? navColor : navColor.withOpacity(0.45),
          ),
          label: 'Scan',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/inventory_icon.png',
            height: 37,
            width: 37,
            color: selectedIndex == 3 ? navColor : navColor.withOpacity(0.45),
          ),
          label: 'Inventory',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/profile_icon.png',
            height: 40,
            width: 40,
            color: selectedIndex == 4 ? navColor : navColor.withOpacity(0.45),
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
