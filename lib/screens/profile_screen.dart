import 'package:flutter/material.dart';
import '../widgets/custom_navbar.dart'; // adjust path if needed

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Constants
  static const double dashboardLogoHeight = 59;

  static const headerStyle = TextStyle(
    fontSize: 46,
    fontWeight: FontWeight.bold,
    color: Color(0xFFD8FF76),
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
                  const Text('Profile', style: headerStyle),
                ],
              ),
              const SizedBox(height: 20),

              // Placeholder for future Profile content
              const Center(
                child: Text(
                  "Profile Content Here",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: const CustomNavBar(
        selectedIndex: 4,
      ), // Profile tab index
    );
  }
}
