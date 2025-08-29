import 'package:flutter/material.dart';
import '../widgets/custom_navbar.dart'; // adjust path if needed

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
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
                  const Text('Transactions', style: headerStyle),
                ],
              ),
              const SizedBox(height: 20),

              // Placeholder for future Transactions content
              const Center(
                child: Text(
                  "Transactions Content Here",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: const CustomNavBar(
        selectedIndex: 3,
      ), // Transactions tab index
    );
  }
}
