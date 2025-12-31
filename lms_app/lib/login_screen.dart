import 'package:flutter/material.dart';
import 'package:lms_app/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    const appColor = Color(0xFFA91D22); // Warna Merah Dashboard
    // Warna merah marun dari gambar asli diganti dengan varian biru atau tetap merah untuk kontras?
    // User request: "warnanya kamu pakek warna ala2 fb". Jadi kita ganti merah menjadi Biru FB.
    
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          // 1. Gambar Header (Gedung)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 350,
            child: Image.network(
              'https://images.unsplash.com/photo-1562774053-701939374585?q=80&w=2886&auto=format&fit=crop', // Placeholder gedung kampus
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(color: Colors.grey[300]);
              },
              errorBuilder: (context, error, stackTrace) => Container(color: Colors.red[100]),
            ),
          ),

          // 2. Konten Utama dengan Kurva Putih
          Positioned.fill(
            top: 280, // Mulai sedikit tumpang tindih dengan gambar
            child: ClipPath(
              clipper: TopCurveClipper(),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ListView(
                  padding: const EdgeInsets.only(top: 60, bottom: 120), // Padding bawah agar tidak tertutup Wave
                  children: [
                   const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 30),
                    
                    // Email Field
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Email 365',
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: appColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Password Field
                    TextField(
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.grey),
                         enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: appColor),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                            color: Colors.black54,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Tombol Login
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigasi ke Dashboard
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const DashboardScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appColor, 
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 5,
                        ),
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Bantuan ?
                    Center(
                      child: TextButton(
                        onPressed: () {
                          _showHelpBottomSheet(context);
                        },
                        child: const Text(
                          'Bantuan ?',
                          style: TextStyle(
                            color: appColor, // Menggunakan Merah untuk konsistensi
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          


          // 3. Logo Lingkaran
          Positioned(
            top: 240,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  // Background putih dengan icon biru agar kontras dan bersih
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                  color: Colors.white, // Background putih
                ),
                child: const Center(
                  child: Icon(Icons.school, size: 40, color: appColor),
                ),
              ),
            ),
          ),
          
          // 4. Gelombang Bawah (Footer Wave)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 100, // Tinggi area wave
            child: CustomPaint(
              painter: BottomWavePainter(color: Colors.brown[400]!), // Warna footer di gambar agak kecoklatan/merah pudar
              // Ganti ke varian biru gelap atau sesuai prompt "warna ala fb" -> Biru
              child: Container(),
            ),
          ),
        ],
      ),
    );
  }
  void _showHelpBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        String currentLang = 'ID'; // Default

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            
             // Content Data Map
            final Map<String, Map<String, String>> content = {
              'ID': {
                'p1': 'Akses hanya untuk Dosen dan Mahasiswa Telkom University.',
                'p2': 'Login menggunakan Akun Microsoft Office 365 dengan mengikuti petunjuk berikut :',
                'p3': 'Username (Akun iGracias) ditambahkan "@365.telkomuniversity.ac.id"',
                'p4': 'Password (Akun iGracias) pada kolom Password.',
                'p5': 'Kegagalan yang terjadi pada Autentikasi disebabkan oleh Anda belum mengubah Password Anda menjadi "Strong Password". Pastikan Anda telah melakukan perubahan Password di iGracias.',
                'p6': 'Informasi lebih lanjut dapat menghubungi Layanan CeLOE Helpdesk di :',
                'contact': 'Mail : infoceloe@telkomuniversity.ac.id\nwhatsapp : +62 821-1666-3563',
              },
              'EN': {
                'p1': 'Access restricted only for Lecturer and Student of Telkom University',
                'p2': 'Login only using your Microsoft Office 365 Account by following these format :',
                'p3': 'Username (iGracias Account) followed with "@365.telkomuniversity.ac.id"',
                'p4': 'Password (SSO / iGracias Account) on Password Field.',
                'p5': 'Failure upon Authentication could be possibly you have not yet change your password into "Strong Password". Make sure to change your Password only in iGracias.',
                'p6': 'For further Information, please contact CeLOE Service Helpdesk :',
                'contact': 'mail : infoceloe@telkomuniversity.ac.id\nwhatsapp : +62 821-1666-3563',
              }
            };

            final t = content[currentLang]!;

            return Container(
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  // Handle Bar
                  Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2.5),
                    ),
                  ),
                  const SizedBox(height: 15),
                  
                  // Language Switcher Headers
                  const Text(
                    'Bottom Sheet (Bantuan /HELP ...',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                   const SizedBox(height: 15),

                  // Flags Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ID
                      GestureDetector(
                        onTap: () => setModalState(() => currentLang = 'ID'),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: currentLang == 'ID' ? const BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.red, width: 3))
                              ) : null,
                              // Emoticon flag as simple solution, or Icon if available. Text flag is easiest.
                              child: const Text('🇮🇩', style: TextStyle(fontSize: 24)), 
                            ),
                            Text('ID', style: TextStyle(
                              fontWeight: currentLang == 'ID' ? FontWeight.bold : FontWeight.normal,
                              color: currentLang == 'ID' ? Colors.black : Colors.grey
                            )),
                          ],
                        ),
                      ),
                      const SizedBox(width: 50),
                      // EN
                      GestureDetector(
                        onTap: () => setModalState(() => currentLang = 'EN'),
                        child: Column(
                          children: [
                             Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: currentLang == 'EN' ? const BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.red, width: 3))
                              ) : null,
                              child: const Text('🇬🇧', style: TextStyle(fontSize: 24)),
                            ),
                            Text('EN', style: TextStyle(
                              fontWeight: currentLang == 'EN' ? FontWeight.bold : FontWeight.normal,
                              color: currentLang == 'EN' ? Colors.black : Colors.grey
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  
                  // Text Content
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      children: [
                        Text(
                          t['p1']!,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 13, height: 1.5, color: Colors.black87),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          t['p2']!,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 13, height: 1.5, color: Colors.black87),
                        ),
                        const SizedBox(height: 8),
                         Padding(
                           padding: const EdgeInsets.only(left: 0.0),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(t['p3']!, style: const TextStyle(fontSize: 13, height: 1.5, color: Colors.black87)),
                               Text(t['p4']!, style: const TextStyle(fontSize: 13, height: 1.5, color: Colors.black87)),
                             ],
                           ),
                         ),
                        const SizedBox(height: 12),
                        Text(
                          t['p5']!,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 13, height: 1.5, color: Colors.black87),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          t['p6']!,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 13, height: 1.5, color: Colors.black87),
                        ),
                        const SizedBox(height: 8),
                         Text(
                          t['contact']!,
                          style: const TextStyle(fontSize: 13, height: 1.5, fontWeight: FontWeight.bold, color: Colors.black87),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

// Clipper untuk kurva atas container putih
class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // Mulai dari kiri bawah (sebenarnya kita ingin fill bawahnya, jadi mulai dari kiri agak atas)
    // Logika clip: area yang TETAP ada.
    
    // Kita ingin memotong bagian atas container menjadi miring / curve.
    // Container mulai dari posisi 'top: 280'.
    
    // Bentuk kurva: Kiri lebih rendah, Kanan lebih tinggi.
    path.moveTo(0, 40); // Mulai turun sedikit di kiri
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0); // Kanan paling atas
    
    // Curve dari kanan atas ke kiri bawah
    // Control point untuk curve
    // Gambar menunjukkan kurva landai.
    // Dari (W, 0) ke (0, 40)
    
    // Mari pakai quadratic bezier
    // path.quadraticBezierTo(controlX, controlY, endX, endY);
    
    // Reset path untuk logika yang benar:
    // Kita menggambar shape container putihnya.
    path.reset();
    path.moveTo(0, 50); // Titik kiri atas (agak turun)
    
    // Curve naik ke kanan atas
    path.quadraticBezierTo(size.width / 4, 20, size.width, 0);
    
    path.lineTo(size.width, size.height); // Kanan bawah
    path.lineTo(0, size.height); // Kiri bawah
    path.close();
    
    return path;
    
    // Revisi bentuk sesuai gambar Login Page:
    // Garis miring naik lurus atau sedikit melengkung dari kiri ke kanan.
    // Di gambar: kiri bawah bukit, kanan atas bukit. Logo di tengah lembah?
    // Oh, di gambar login page:
    // Batas antara foto dan putih adalah Melengkung Cekung di tengah (tempat logo).
    // Kiri lebih tinggi, Kanan lebih tinggi, Tengah rendah?
    // Tidak, lihat gambar: Garis putih memotong foto secara diagonal lalu melengkung?
    // Sepertinya kurva Sederhana: Miring naik dari kiri ke kanan?
    // Mari buat kurva Quadric sederhana cekung ke bawah atau ke atas.
    
    // Percobaan: Kurva landai naik
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Painter untuk Footer Wave
class BottomWavePainter extends CustomPainter {
  final Color color;
  BottomWavePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    // Warna ala FB -> Biru agak gelap atau transparan
    final paint = Paint()
      ..color = const Color(0xFFA91D22).withValues(alpha: 0.8) // Override warna parameter
      ..style = PaintingStyle.fill;

    final path = Path();
    // Wave shape di bawah
    // Mulai dari kiri bawah
    path.moveTo(0, size.height); 
    path.lineTo(0, size.height * 0.4); // Kiri agak naik
    
    // Gelombang naik turun
    path.quadraticBezierTo(
      size.width * 0.3, size.height * 0.1, // Control point 1 (Puncak bukit)
      size.width * 0.6, size.height * 0.5, // Titik tengah
    );
    path.quadraticBezierTo(
      size.width * 0.9, size.height * 0.9, // Control point 2 (Lembah)
      size.width, size.height * 0.6, // Ujung kanan
    );
    
    path.lineTo(size.width, size.height); // Kanan bawah
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
