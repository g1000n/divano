import 'package:flutter/material.dart';
import '../screens/dashboard_screen.dart';
import '../screens/inventory_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/qr_screen.dart';
// import '../screens/logistics_screen.dart'; // if you have it


class CustomNavBar extends StatelessWidget {
  final int selectedIndex;

  const CustomNavBar({super.key, required this.selectedIndex});

  void _onItemTapped(BuildContext context, int index) {
    if (index == selectedIndex) return; // do nothing if same tab

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const DashboardScreen()),
        );
        break;
      case 1:
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LogisticsScreen()));
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const QRScreen()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const InventoryScreen()),
        );
        break;
      case 4:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ProfileScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    const weeklyReportColor = Color(0xFFD8FF76);

    return BottomNavigationBar(
      backgroundColor: const Color(0xFF1E2237),
      selectedItemColor: weeklyReportColor,
      unselectedItemColor: weeklyReportColor.withOpacity(0.45),
      currentIndex: selectedIndex,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      onTap: (index) => _onItemTapped(context, index),
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/home_icon.png',
            height: 40,
            width: 40,
            color: selectedIndex == 0
                ? weeklyReportColor
                : weeklyReportColor.withOpacity(0.45),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/logistics_icon.png',
            height: 45,
            width: 45,
            color: selectedIndex == 1
                ? weeklyReportColor
                : weeklyReportColor.withOpacity(0.45),
          ),
          label: 'Logistics',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/qr_icon.png',
            height: 60,
            width: 60,
            color: selectedIndex == 2
                ? weeklyReportColor
                : weeklyReportColor.withOpacity(0.45),
          ),
          label: 'Scan',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/inventory_icon.png',
            height: 37,
            width: 37,
            color: selectedIndex == 3
                ? weeklyReportColor
                : weeklyReportColor.withOpacity(0.45),
          ),
          label: 'Inventory',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/profile_icon.png',
            height: 40,
            width: 40,
            color: selectedIndex == 4
                ? weeklyReportColor
                : weeklyReportColor.withOpacity(0.45),
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
