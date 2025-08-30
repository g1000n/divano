import 'package:flutter/material.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/screen_header.dart';
import 'dashboard_screen.dart';
import 'inventory_screen.dart';
import 'profile_screen.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({super.key});

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  // Handle navbar taps
  void _onNavTap(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const DashboardScreen()),
        );
        break;
      case 1:
        // LogisticsScreen (if exists)
        break;
      case 2:
        // Already on QRScreen
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
    return Scaffold(
      backgroundColor: const Color(0xFF1E2237),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
          ).copyWith(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              // Consistent header
              ScreenHeader(title: "QR Scan"),
              SizedBox(height: 20),

              // Placeholder for QR scanner
              Expanded(
                child: Center(
                  child: Text(
                    "QR Scanner Content Here",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: CustomNavBar(
        selectedIndex: 2, // QR tab
        onTap: _onNavTap,
      ),
    );
  }
}
