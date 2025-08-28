import 'package:flutter/material.dart';
import 'screens/logo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NaviApp',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1E2432),
      ),
      home: const LogoPage(),
    );
  }
}
