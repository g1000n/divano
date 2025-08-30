import 'package:flutter/material.dart';
import '../widgets/screen_header.dart';
import 'dashboard_screen.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

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
              const ScreenHeader(title: "Transactions"),
              const SizedBox(height: 20),

              // Content placeholder
              const Expanded(
                child: Center(
                  child: Text(
                    "Transactions Content Here",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),

              // Back button at bottom
              Center(
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    // ✅ Always go back to Dashboard instead of Welcome
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardScreen(),
                      ),
                      (route) => false, // remove all previous routes
                    );
                  },
                  child: Image.asset(
                    'assets/images/back_button.png',
                    width: 60,
                    height: 60,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
