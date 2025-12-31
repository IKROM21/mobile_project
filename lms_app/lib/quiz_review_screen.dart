import 'package:flutter/material.dart';
import 'package:lms_app/quiz_attempt_screen.dart';

class QuizReviewScreen extends StatelessWidget {
  const QuizReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Review Jawaban',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFA91D22),
        elevation: 0,
        foregroundColor: Colors.white,
        leading: Container(), // Hide back button if needed or keep default
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Summary Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildSummaryRow('Di Mulai Pada', 'Kamis 25 Februari 2021 10:25'),
                  _buildSummaryRow('Status', 'Selesai'),
                  _buildSummaryRow('Selesai Pada', 'Kamis 25 Februari 2021 10:40'),
                  _buildSummaryRow('Waktu Penyelesaian', '13 Menit 22 Detik'),
                  _buildSummaryRow('Nilai', '0 / 100'),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Question List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 7, // Image shows 7 questions
              itemBuilder: (context, index) {
                return _buildQuestionReviewItem(context, index + 1);
              },
            ),

            const SizedBox(height: 30),

            // Button
            SizedBox(
              width: 180,
              child: ElevatedButton(
                onPressed: () {
                   // Submit action
                   Navigator.popUntil(context, (route) => route.settings.name == '/class_detail' || route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00E676), // Bright Green
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text(
                  'Kirim Jawaban',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionReviewItem(BuildContext context, int number) {
    // Dummy Data Cycling
    String question = "Radio button dapat digunakan untuk menentukan ?";
    String answer = "A. Jenis Kelamin";
    if (number % 3 == 2) {
      question = "Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?";
      answer = "B. Konsistensi";
    } else if (number % 3 == 0) {
      question = "Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?";
      answer = "C. Konsistensi";
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              "Pertanyaan $number",
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    question,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Jawaban Tersimpan",
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            answer,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => QuizAttemptScreen(
                               title: 'Quiz Review 1',
                               isReviewMode: true,
                               initialIndex: number - 1,
                             ),
                           ),
                         );
                      },
                      child: const Text(
                        "Lihat Soal",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
