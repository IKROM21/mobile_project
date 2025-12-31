import 'package:flutter/material.dart';
import 'package:lms_app/announcement_detail_screen.dart';

class AnnouncementScreen extends StatelessWidget {
  const AnnouncementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Shared Bottom Nav (Visual only for consistency, or functional if needed)
    // Since this is a sub-screen, usually we don't put the main bottom nav unless it's a main tab.
    // However, the screenshot shows the bottom nav.
    // We will implement it as a visual element or functional one that pops back to dashboard.
    
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
          'Pengumuman',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const [
          _AnnouncementItem(
            title: 'Maintenance Pra UAS Semester Genap 2020/2021',
            subtitle: 'By Admin Celoe - Rabu, 2 Juni 2021, 10:45',
          ),
          _AnnouncementItem(
            title: 'Pengumuman Maintance',
            subtitle: 'By Admin Celoe - Senin, 11 Januari 2021, 7:52',
          ),
          _AnnouncementItem(
            title: 'Maintenance Pra UAS Semeter Ganjil 2020/2021',
            subtitle: 'By Admin Celoe - Minggu, 10 Januari 2021, 9:30',
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
            selectedItemColor: Colors.white70, 
            unselectedItemColor: Colors.white70,
            currentIndex: 0, 
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            onTap: (index) {
              if (index == 0) {
                 Navigator.pop(context); // Kembali ke Home/Dashboard
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
}

class _AnnouncementItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const _AnnouncementItem({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AnnouncementDetailScreen()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Megaphone Icon
            const Icon(Icons.campaign, size: 40, color: Colors.black), 
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold, // Bold title
                      color: Colors.black87,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
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
