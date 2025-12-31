import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lms_app/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigasi ke halaman login setelah 3 detik
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Warna Merah Dashboard
    const appColor = Color(0xFFA91D22);

    return Scaffold(
      backgroundColor: appColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Representasi (Menggunakan Text/Icon karena aset gambar tidak tersedia)
            // Menggunakan Stack untuk meniru gaya logo "celoe" yang terhubung
            SizedBox(
              height: 100,
              width: 200,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Positioned(
                    left: 20,
                    child: Text(
                      'ce',
                      style: TextStyle(
                        fontFamily: 'Sans-serif',
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: -2,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    child: Container(
                      height: 10,
                      width: 80,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                   const Positioned(
                    right: 20,
                    child: Text(
                      'oe',
                      style: TextStyle(
                        fontFamily: 'Sans-serif',
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                         letterSpacing: -2,
                      ),
                    ),
                  ),
                   const Positioned(
                    child: Icon(Icons.school, size: 50, color: Colors.white), 
                   ) // Icon buku/topi wisuda sebagai pengganti elemen grafis tengah
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Learning Management System',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
