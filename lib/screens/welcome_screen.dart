import 'package:flutter/material.dart';
import 'login_screen.dart'; // 👈 import your login screen

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Secondary Logo (smaller)
                Image.asset(
                  'assets/images/secondary_logo.png',
                  width: 120, // smaller than before
                ),
                const SizedBox(height: 15),

                // Welcome image (higher)
                Image.asset('assets/images/welcome.png', width: 200),

                const SizedBox(height: 30), // less gap before Login
                // Login button
                SizedBox(
                  width: double.infinity,
                  height: 55, // slightly fatter
                  child: ElevatedButton(
                    onPressed: () {
                      // ✅ navigate to LoginScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFCAEB78),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ),

                const SizedBox(height: 12), // slightly smaller gap
                // Sign Up button
                SizedBox(
                  width: double.infinity,
                  height: 55, // same fatness
                  child: OutlinedButton(
                    onPressed: () {
                      // Sign Up action (for later)
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFCAEB78)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 18, color: Color(0xFFCAEB78)),
                    ),
                  ),
                ),

                const SizedBox(height: 5), // bring Forgot Password closer
                // Forgot password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Forgot password action (placeholder)
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFFCAEB78), // same green
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
