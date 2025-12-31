import 'package:flutter/material.dart';

import 'package:lms_app/notification_screen.dart';
import 'package:lms_app/class_detail_screen.dart';

class MyClassesScreen extends StatelessWidget {
  const MyClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryRed = const Color(0xFFA91D22);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Kelas Saya',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          _buildClassItem(
            color: Colors.amber,
            iconOrText: 'UI/UX',
            title: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA D4SM-42-03 [ADY]',
            progress: 0.89,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ClassDetailScreen()),
              );
            },
          ),
          _buildClassItem(
            color: Colors.red.shade900,
            iconOrText: 'PKN',
            isIcon: true, 
            iconData: Icons.local_police, // Symbol for citizenship/state
            title: 'KEWARGANEGARAAN\nD4SM-41-GAB1 [BBO]. JUMAT 2',
            progress: 0.86,
          ),
          _buildClassItem(
            color: Colors.orange,
            iconOrText: 'OS',
            title: 'SISTEM OPERASI\nD4SM-44-02 [DDS]',
            progress: 0.90,
          ),
          _buildClassItem(
             color: Colors.cyanAccent.shade200,
            iconOrText: 'Mob',
            title: 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA\nD4SM-41-GAB1 [APJ]',
            progress: 0.90,
          ),
          _buildClassItem(
            color: Colors.grey.shade300,
            iconOrText: 'Eng',
            title: 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC\nD4SM-41-GAB1 [ARS]',
            progress: 0.80,
          ),
          _buildClassItem(
            color: Colors.blue.shade700,
            iconOrText: 'PMI',
            title: 'PEMROGRAMAN MULTIMEDIA INTERAKTIF\nD4SM-43-04 [TPR]',
            progress: 0.90,
          ),
          _buildClassItem(
            color: Colors.purple.shade300,
            iconOrText: 'Sport',
            isIcon: true,
            iconData: Icons.sports_basketball,
            title: 'OLAH RAGA\nD3TT-44-02 [EYR]',
            progress: 0.90,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: primaryRed,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            backgroundColor: primaryRed,
            selectedItemColor: Colors.white, // Active logic handled visually
            unselectedItemColor: Colors.white70,
            currentIndex: 1, // Highlight 'Kelas Saya'
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            onTap: (index) {
              if (index == 0) {
                 Navigator.of(context).popUntil((route) => route.isFirst);
              } else if (index == 2) {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotificationScreen()),
                );
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Kelas Saya',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notifikasi',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClassItem({
    required Color color,
    required String iconOrText,
    required String title,
    required double progress,
    bool isIcon = false,
    IconData? iconData,
    VoidCallback? onTap,
  }) {
    Color primaryRed = const Color(0xFFA91D22);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 25),
        color: Colors.transparent, // Ensures hit test works on empty spaces
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail Image Placeholder
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(0), // Square as per image mostly
              ),
              child: Center(
                child: isIcon
                    ? Icon(iconData, color: Colors.white, size: 40)
                    : Text(
                        iconOrText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
              ),
            ),
            const SizedBox(width: 15),
            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '2021/2',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Progress Bar
                  Stack(
                    children: [
                      Container(
                        height: 8,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          
                          boxShadow: [
                             BoxShadow(
                               color: Colors.black.withOpacity(0.05),
                               blurRadius: 2,
                               offset: const Offset(0, 1)
                             )
                          ],
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      Container(
                        height: 8,
                        width: 200 * progress, // Approximation
                        decoration: BoxDecoration(
                          color: primaryRed,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${(progress * 100).toInt()}% Selesai',
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black87,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
