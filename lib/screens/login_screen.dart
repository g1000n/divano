import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // You can adjust these values to reposition logo and input block
  final double logoTopOffset = 270; // Moves the logo up/down
  final double inputTopOffset = 430; // Moves username/password block up/down

  @override
  Widget build(BuildContext context) {
    const greenColor = Color(0xFFCAEB78);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Back button top-left
            Positioned(
              top: 16,
              left: 16,
              child: GestureDetector(
                onTap: () {
                  // Navigate back to WelcomeScreen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomeScreen(),
                    ),
                  );
                },
                child: Image.asset(
                  'assets/images/back_button.png',
                  width: 60,
                  height: 60,
                ),
              ),
            ),

            // Logo
            Positioned(
              top: logoTopOffset, 
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  'assets/images/secondary_logo.png',
                  width: 120,
                  height: 120,
                ),
              ),
            ),

            // Username/Password block
            Positioned(
              top: inputTopOffset, // adjust to move inputs lower or higher
              left: 24,
              right: 24,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Username field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Username',
                        style: TextStyle(color: greenColor, fontSize: 22),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _usernameController,
                        style: const TextStyle(color: greenColor, fontSize: 16),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: greenColor,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: greenColor,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: greenColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Password field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Password',
                        style: TextStyle(color: greenColor, fontSize: 22),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _passwordController,
                        style: const TextStyle(color: greenColor, fontSize: 16),
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: greenColor,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: greenColor,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: greenColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 1),

                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: greenColor, fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Forward button bottom-center
            Positioned(
              bottom: 140,
              left: 0,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardScreen(),
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/images/forward_button.png',
                    width: 60,
                    height: 60,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
