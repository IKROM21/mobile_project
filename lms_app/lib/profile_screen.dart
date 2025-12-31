import 'package:flutter/material.dart';
import 'package:lms_app/login_screen.dart'; // For Logout navigation
import 'package:lms_app/notification_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
   // Warna Merah Marun sesuai permintaan
  final Color primaryRed = const Color(0xFFA91D22);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Tinggi header fix agar konsisten di semua layar (Mobile/Desktop)
    const double headerHeight = 340.0;
    
    return Scaffold(
      backgroundColor: primaryRed, 
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
            selectedItemColor: Colors.white70, // Tidak ada yang aktif secara khusus, atau samakan
            unselectedItemColor: Colors.white70,
            currentIndex: 0, 
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            onTap: (index) {
              if (index == 0) {
                 Navigator.pop(context); // Kembali ke Home/Dashboard
              } else if (index == 2) {
                 Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const NotificationScreen())
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
      body: Stack(
        children: [
          // 1. Red Header Content (Fixed Height)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: headerHeight,
            child: SafeArea( // SafeArea hanya untuk bagian atas
              bottom: false,
              child: Column(
                children: [
                   // Back Button
                   Padding(
                     padding: const EdgeInsets.only(left: 10, top: 10),
                     child: Align(
                       alignment: Alignment.topLeft,
                       child: IconButton(
                         icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                         onPressed: () => Navigator.pop(context),
                       ),
                     ),
                   ),
                   // Profile Content
                   Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                        Container(
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           border: Border.all(color: Colors.white.withOpacity(0.2), width: 3),
                         ),
                         child: CircleAvatar(
                           radius: 50, 
                           backgroundColor: Colors.white.withOpacity(0.2), // Transparan
                           // Gambar dihapus, diganti Icon sesuai permintaan
                           child: const Icon(Icons.person, size: 60, color: Colors.white),
                         ),
                       ),
                       const SizedBox(height: 15),
                       const Text(
                         'IKROM SAMAUDIN',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                           letterSpacing: 0.5,
                         ),
                       ),
                     ],
                   ),
                ],
              ),
            ),
          ),
          
          // 2. White Sheet Content 
          // Mengisi sisa layar dari "headerHeight - 40" sampai bawah
          Positioned(
             top: headerHeight - 40,
             left: 0,
             right: 0,
             bottom: 0,
             child: Container(
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: const BorderRadius.only(
                   topLeft: Radius.circular(30),
                   topRight: Radius.circular(30),
                 ),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.black.withOpacity(0.1),
                     blurRadius: 10,
                     offset: const Offset(0, -5),
                   ),
                 ],
               ),
               child: Column(
                 children: [
                   const SizedBox(height: 10),
                   // Tab Bar
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20),
                     child: TabBar(
                       controller: _tabController,
                       labelColor: Colors.black,
                       unselectedLabelColor: Colors.grey,
                       indicatorColor: Colors.black,
                       indicatorSize: TabBarIndicatorSize.label,
                       indicatorWeight: 3,
                       dividerColor: Colors.transparent,
                       tabs: const [
                         Tab(text: 'About Me'),
                         Tab(text: 'Kelas'),
                         Tab(text: 'Edit Profile'),
                       ],
                     ),
                   ),
                    
                   // Tab Content
                   Expanded(
                     child: TabBarView(
                       controller: _tabController,
                       children: [
                         // About Me Tab
                         _buildAboutMeTab(),
                         // Kelas Tab
                         _buildKelasTab(),
                         // Edit Profile
                         _buildEditProfileTab(),
                       ],
                     ),
                   ),
                 ],
               ),
             ),
          ),
          
          // 3. Floating Logout Button
          Positioned(
            bottom: 30,
            right: 20,
            child: ElevatedButton.icon(
              onPressed: () {
                // Logout Logic -> Back to Login
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
              icon: const Icon(Icons.logout, color: Colors.white),
              label: const Text(
                'Log Out', 
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB71C1C), // Merah gelap
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(color: Colors.white, width: 2),
                ),
                elevation: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutMeTab() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: const [
        Text(
          'Informasi User',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 20),
        
        _InfoItem(
          label: 'Email address',
          value: 'ikromsamaudin@365.telkomuniversity.ac.id',
        ),
        
        _InfoItem(
          label: 'Program Studi',
          value: 'D4 Teknologi Rekayasa Multimedia',
        ),
        
        _InfoItem(
          label: 'Fakultas',
          value: 'FIT',
        ),
        
        SizedBox(height: 30),
        
        Text(
          'Aktivitas Login',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 20),
        
        _InfoItem(
          label: 'First access to site',
          value: 'Monday, 7 September 2020, 9:27 AM (288 days 12 hours)',
        ),
        
        _InfoItem(
          label: 'Last access to site',
          value: 'Tuesday, 22 June 2021, 9:44 PM (now)',
        ),
        
        SizedBox(height: 80), // Space for FAB
      ],
    );
  }

  Widget _buildKelasTab() {
    final List<Map<String, String>> classList = [
      {
        'title': 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC\nD4SM-41-GAB1 [ARS]',
        'date': 'Tanggal Mulai Monday, 8 February 2021',
      },
      {
        'title': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA\nD4SM-42-03 [ADY]',
        'date': 'Tanggal Mulai Monday, 8 February 2021',
      },
      {
        'title': 'KEWARGANEGARAAN\nD4SM-41-GAB1 [BBO]. JUMAT 2',
        'date': 'Tanggal Mulai Monday, 8 February 2021',
      },
      {
        'title': 'OLAH RAGA D3TT-44-02 [EYR]',
        'date': 'Tanggal Mulai Monday, 8 February 2021',
      },
      {
        'title': 'PEMROGRAMAN MULTIMEDIA INTERAKTIF\nD4SM-43-04 [TPR]',
        'date': 'Tanggal Mulai Monday, 8 February 2021',
      },
      {
        'title': 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA\nD4SM-41-GAB1 [APJ]',
        'date': 'Tanggal Mulai Monday, 8 February 2021',
      },
      {
        'title': 'SISTEM OPERASI D4SM-44-02 [DDS]',
        'date': 'Tanggal Mulai Monday, 8 February 2021',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      itemCount: classList.length + 1, // +1 for extra space bottom
      itemBuilder: (context, index) {
        if (index == classList.length) {
          return const SizedBox(height: 80); // Spacer for FAB/Bottom area
        }
        final item = classList[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               // Blue Rounded Box Icon
              Container(
                width: 70, // Lebar kotak biru
                height: 40, // Tinggi kotak biru agak pipih seperti di gambar
                decoration: BoxDecoration(
                  color: const Color(0xFF85B4D6), // Soft Blue like screenshot
                  borderRadius: BorderRadius.circular(20), // Rounded pill shape
                ),
              ),
              const SizedBox(width: 15),
              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title']!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['date']!,
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
        );
      },
    );
  }

  Widget _buildEditProfileTab() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _buildTextField('Nama Pertama'),
        const SizedBox(height: 15),
        _buildTextField('Nama Terakhir'),
        const SizedBox(height: 15),
        _buildTextField('E-mail Address'),
        const SizedBox(height: 15),
        _buildTextField('Negara'),
        const SizedBox(height: 15),
        _buildTextField('Deskripsi', maxLines: 5),
        const SizedBox(height: 30),
        
        // Tombol Simpan
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[200], // Warna background abu-abu muda
              foregroundColor: Colors.black, // Warna teks hitam
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Simpan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
         const SizedBox(height: 80), // Spacer bottom
      ],
    );
  }

  Widget _buildTextField(String label, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.grey),
            ),
             focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String label;
  final String value;

  const _InfoItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
