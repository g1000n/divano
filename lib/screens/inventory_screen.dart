import 'package:flutter/material.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/screen_header.dart';
import 'dashboard_screen.dart';
import 'qr_screen.dart';
import 'profile_screen.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  int _selectedIndex = 3; // Inventory tab index

  void _onNavTap(int index) {
    if (index == _selectedIndex) return;
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const DashboardScreen()),
        );
        break;
      case 1:
        // LogisticsScreen()
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const QRScreen()),
        );
        break;
      case 3:
        break; // current screen
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
    return Scaffold(
      backgroundColor: const Color(0xFF1E2237),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
          ).copyWith(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Use reusable header
              const ScreenHeader(title: "Inventory"),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "Inventory Content Here",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
