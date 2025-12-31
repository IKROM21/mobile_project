import 'package:flutter/material.dart';
import 'package:lms_app/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LMS App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1877F2), // Facebook Blue
          primary: const Color(0xFF1877F2),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
