import 'package:flutter/material.dart';
import '../widgets/custom_navbar.dart'; // make sure the path is correct

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  // Constants
  static const double dashboardLogoHeight = 59;

  static const headerStyle = TextStyle(
    fontSize: 46,
    fontWeight: FontWeight.bold,
    color: Color(0xFFD8FF76), // same as dashboard
  );

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
              // Header with logo + title
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/secondary_logo.png",
                    height: dashboardLogoHeight,
                    width: dashboardLogoHeight,
                  ),
                  const SizedBox(width: 2),
                  const Text('Inventory', style: headerStyle),
                ],
              ),
              const SizedBox(height: 20),

              // Placeholder for future Inventory content
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

      // Use the reusable CustomNavBar
      bottomNavigationBar: const CustomNavBar(
        selectedIndex: 3,
      ), // Inventory tab index
    );
  }
}
