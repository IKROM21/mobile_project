import 'package:flutter/material.dart';
import 'dart:async';
import 'package:lms_app/quiz_review_screen.dart';

class QuizAttemptScreen extends StatefulWidget {
  final String title;
  final bool isReviewMode;
  final int initialIndex;

  const QuizAttemptScreen({
    super.key, 
    this.title = 'Quiz Review 1',
    this.isReviewMode = false,
    this.initialIndex = 0,
  });

  @override
  State<QuizAttemptScreen> createState() => _QuizAttemptScreenState();
}

class _QuizAttemptScreenState extends State<QuizAttemptScreen> {
  // Timer logic
  late Timer _timer;
  int _start = 900; // 15:00 minutes in seconds

  final int _totalQuestions = 15;
  int _currentQuestionIndex = 0;
  final Map<int, int> _answers = {};

  final List<Map<String, dynamic>> _questions = [
    {
      'question': "Radio button dapat digunakan untuk menentukan ?",
      'options': ["Jenis Kelamin", "Alamat", "Hobby", "Riwayat Pendidikan", "Umur"],
    },
    {
      'question': "Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?",
      'options': ["Intergrasi", "Standarisasi", "Konsistensi", "Koefensi", "Koreksi"],
    },
    {
      'question': "Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?",
      'options': ["Hobby", "Alamat", "Jenis Kelamin", "Riwayat Pendidikan", "Umur"],
    },
    // Generate dummy questions for the rest
    for (int i = 4; i <= 15; i++)
      {
        'question': "Pertanyaan dummy nomor $i untuk testing kuis.",
        'options': ["Pilihan A", "Pilihan B", "Pilihan C", "Pilihan D", "Pilihan E"],
      },
  ];

  final List<String> _optionLabels = ["A", "B", "C", "D", "E"];

  @override
  void initState() {
    super.initState();
    startTimer();
    
    // Pre-fill answers to simulate the 'Review' state shown in mockup (all green)
    // Indices 0-13 (Q1-Q14) are answered.
    for (int i = 0; i < 14; i++) {
      _answers[i] = 0; // Just picking first option as dummy answer
    }
    
    if (widget.isReviewMode) {
      _currentQuestionIndex = widget.initialIndex;
    } else {
      // Normal flow demo logic: Start at Q2 (Index 1) as requested previously, 
      // but if we want to be safe, stick to 1 unless it breaks something.
      // previous request was "tampilkan halaman pada gambar" which was Q2.
      // But now we are past that.
      // Let's keep the existing "jump to 2" logic ONLY if we are defaulting.
      // Actually, standard behavior should be 0.
      // But for the previous demo "Start at Q2", we set it to 1.
      // And then Q3 step set it to 2. 
      // Let's just default to widget.initialIndex (which is 0) but keep the demo pre-fills.
      // Wait, if I change this, the previous demo "Review 2->3" might break if I reload.
      // But this is a new request.
      // I'll adhere to widget.initialIndex for review mode.
       _currentQuestionIndex = 2; // Keep previous demo state for non-review mode
    }
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String get timerString {
    Duration duration = Duration(seconds: _start);
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes : $seconds';
  }

  @override
  Widget build(BuildContext context) {
    // Current Question Data
    final currentQ = _questions[_currentQuestionIndex];
    final String questionText = currentQ['question'];
    final List<String> options = currentQ['options'];
    
    // Current selection
    int? currentSelected = _answers[_currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFA91D22),
        elevation: 0,
        leading: Container(),
        leadingWidth: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             const SizedBox(width: 40), 
             Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
             Row(
               children: [
                 const Icon(Icons.timer_outlined, color: Colors.white),
                 const SizedBox(width: 8),
                 Text(
                   timerString,
                   style: const TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold,
                     fontSize: 16,
                   ),
                 ),
               ],
             )
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question Navigator (Circles)
            Center(
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: List.generate(_totalQuestions, (index) {
                  bool isCurrent = index == _currentQuestionIndex;
                  bool isAnswered = _answers.containsKey(index);
                  
                  // Style logic
                  Color bgColor;
                  Color textColor;
                  Border? border;

                  if (isAnswered) {
                    bgColor = const Color(0xFF00E676); // Green
                    textColor = Colors.black; // Or white, image looks like dark text on green
                    border = null;
                  } else if (isCurrent) {
                    bgColor = Colors.grey[300]!; // Highlight
                    textColor = Colors.black;
                    border = null;
                  } else {
                    bgColor = Colors.transparent;
                    textColor = Colors.black;
                    border = Border.all(color: Colors.grey);
                  }

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                         _currentQuestionIndex = index;
                      });
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: bgColor,
                        border: border,
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 30),

            // Question Title
            Text(
              "Soal Nomor ${_currentQuestionIndex + 1} / $_totalQuestions",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),

            // Question Text
            Text(
              questionText,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 30),

            // Options
            ...List.generate(options.length, (index) {
              bool isSelected = currentSelected == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _answers[_currentQuestionIndex] = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFEF5350) : const Color(0xFFF9F9F9), 
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: isSelected 
                      ? [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4, offset: const Offset(0, 2))]
                      : [],
                  ),
                  child: Row(
                    children: [
                      Text(
                        "${_optionLabels[index]}.   ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : Colors.black87,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          options[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: 20),

            // Navigation Buttons
            if (widget.isReviewMode)
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF5F5F5),
                      foregroundColor: Colors.black,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text(
                      'Kembali Ke Halam Review',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Previous Button
                if (_currentQuestionIndex > 0)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentQuestionIndex--;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF5F5F5),
                      foregroundColor: Colors.black87,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Soal Sebelum nya.'),
                  )
                else
                  const SizedBox(), 

                // Next or Finish Button
                if (_currentQuestionIndex == 2 || _currentQuestionIndex == _totalQuestions - 1)
                   ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const QuizReviewScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF42E865), // Bright Green
                      foregroundColor: Colors.black,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text(
                      'Selesai.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                else
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentQuestionIndex++;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF5F5F5),
                      foregroundColor: Colors.black87,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Soal Selanjut nya.'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
