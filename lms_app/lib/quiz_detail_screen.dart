import 'package:flutter/material.dart';
import 'package:lms_app/quiz_attempt_screen.dart';

class QuizDetailScreen extends StatelessWidget {
  final String title;

  const QuizDetailScreen({super.key, this.title = 'Quiz Review 1'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFA91D22),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Description
              const Text(
                'Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis.\nJangan lupa klik tombol Submit Answer setelah menjawab seluruh pertanyaan.',
                style: TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
              ),
              const SizedBox(height: 16),
              const Text(
                "Kerjakan sebelum hari Jum'at, 26 Februari 2021 jam 23:59 WIB.",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              const SizedBox(height: 24),

              // Info Box
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: const [
                    Text(
                      'Kuis Akan di tutup pada Jumat, 26 February 2021, 11:59 PM',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Batas Waktu: 15 menit',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Metode Penilaian: Nilai Tertinggi',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // History Section
              const Text(
                'Percobaan Yang Sudah Di Lakukan',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),

              // Table Header
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFEF5350), // Lighter red for header
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Row(
                  children: const [
                    Expanded(
                      flex: 2,
                      child: Text('Status', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(child: Text('Nilai / 100.00', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13))),
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(alignment: Alignment.centerRight, child: Text('Tinjau Kembali', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13))),
                    ),
                  ],
                ),
              ),
              // Table Row
              Container(
                color: const Color(0xFFF9F9F9),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Selesai', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          SizedBox(height: 4),
                          Text('Dikirim Pada Kamis, 25 Februari 2021, 10:40', style: TextStyle(fontSize: 11, color: Colors.black87)),
                        ],
                      ),
                    ),
                    const Expanded(
                      flex: 2,
                      child: Center(child: Text('85,0', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
                    ),
                     const Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.centerRight, 
                        child: Text(
                          'Lihat', 
                          style: TextStyle(
                            color: Colors.blue, 
                            fontWeight: FontWeight.bold, 
                            fontSize: 13
                          )
                        )
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              
              const Center(
                child: Text(
                  'Nilai Akhir Anda Unutk Kuis Ini Adalah 85.0 / 100.00',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),

              const SizedBox(height: 50),

              // Buttons
              Center(
                child: SizedBox(
                   width: 200,
                   child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuizAttemptScreen(title: title)),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF5F5F5),
                      foregroundColor: Colors.black,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                    ),
                    child: const Text('Ambil Kuis'),
                   ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: SizedBox(
                   width: 200,
                   child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF5F5F5),
                      foregroundColor: Colors.black,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                    ),
                    child: const Text('Kembali Ke Kelas'),
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
