import 'package:flutter/material.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/screen_header.dart';
import 'dashboard_screen.dart';
import 'inventory_screen.dart';
import 'profile_screen.dart';
import 'incoming_package.dart';


class QRScreen extends StatefulWidget {
  const QRScreen({super.key});

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  int _selectedIndex = 2; // QR tab

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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const IncomingPackage(),
          ), // Logistics
        );
        break;
      case 2:
        break; // Already on QRScreen
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
      body: SafeArea(
        child: Column(
          children: [
            // Header
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
              child: ScreenHeader(title: "QR Scan"),
            ),

            // box background
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color(0xFF434A64),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/qr_scanner_icon.png",
                      width: 300,
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 45),

                    GestureDetector(
                      onTap: () {
                        // Handle upload action
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "assets/images/upload_icon.png",
                            width: 30,
                            height: 30,
                            color: const Color(0xFFD8FF76),
                          ),
                          const SizedBox(width: 15),
                          const Text(
                            "Upload QR",
                            style: TextStyle(
                              color: Color(0xFFD8FF76),
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Nav bar
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
