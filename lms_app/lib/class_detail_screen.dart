import 'package:flutter/material.dart';
import 'package:lms_app/profile_screen.dart';
import 'package:lms_app/notification_screen.dart';
import 'package:lms_app/my_classes_screen.dart';
import 'package:lms_app/meeting_detail_sheet.dart';
import 'package:lms_app/task_detail_screen.dart';
import 'package:lms_app/quiz_detail_screen.dart';

class ClassDetailScreen extends StatefulWidget {
  final String title;
  
  const ClassDetailScreen({
    super.key, 
    this.title = 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA D4SM-42-03 [ADY]',
  });

  @override
  State<ClassDetailScreen> createState() => _ClassDetailScreenState();
}

class _ClassDetailScreenState extends State<ClassDetailScreen> {
  int _selectedTabIndex = 0; // 0: Materi, 1: Tugas Dan Kuis

  final Color primaryRed = const Color(0xFFA91D22);
  final Color badgeBlue = const Color(0xFF5CA3E9); // Adjust to match image
  
  // Dummy Data for Meetings (Materi)
  final List<Map<String, dynamic>> meetings = [
    {
      'id': 1,
      'title': '01 - Pengantar User Interface Design',
      'info': '3 URLs, 2 Files, 3 Interactive Content',
      'isCompleted': false, 
    },
    {
      'id': 2,
      'title': '02 - Konsep User Interface Design',
      'info': '2 URLs, 1 Kuis, 3 Files, 1 Tugas',
      'isCompleted': true,
    },
    {
      'id': 3,
      'title': '03 - Interaksi pada User Interface Design',
      'info': '3 URLs, 2 Files, 3 Interactive Content',
      'isCompleted': true,
    },
    {
      'id': 4,
      'title': '04 - Ethnographic Observation',
      'info': '3 URLs, 2 Files, 3 Interactive Content',
      'isCompleted': true,
    },
    {
      'id': 5,
      'title': '05 - UID Testing',
      'info': '3 URLs, 2 Files, 3 Interactive Content',
      'isCompleted': true,
    },
    {
      'id': 6,
      'title': '06 - Assessment 1',
      'info': '3 URLs, 2 Files, 3 Interactive Content',
      'isCompleted': true,
    },
  ];

  // Dummy Data for Tasks & Quizzes
  final List<Map<String, dynamic>> tasks = [
    {
      'type': 'QUIZ',
      'badgeColor': const Color(0xFF5CA3E9), // Blue
      'icon': Icons.quiz_outlined, // Fallback icon
      'customIcon': true, // To simulate chat bubble style
      'title': 'Quiz Review 01',
      'dueDate': '26 Februari 2021 23:59 WIB',
      'isCompleted': true,
    },
    {
      'type': 'Tugas',
      'badgeColor': const Color(0xFF5CA3E9), // Blue similar
      'icon': Icons.assignment_outlined,
      'customIcon': false,
      'title': 'Tugas 01 - UID Android Mobile Game',
      'dueDate': '26 Februari 2021 23:59 WIB',
      'isCompleted': false, // Checkmark grey
    },
    {
      'type': 'Pertemuan 3',
      'badgeColor': const Color(0xFF5CA3E9),
      'icon': Icons.quiz_outlined,
      'customIcon': true,
      'title': 'Kuis - Assessment 2',
      'dueDate': '26 Februari 2021 23:59 WIB',
      'isCompleted': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light grey background
      body: Column(
        children: [
          // Header Red Area
          Container(
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 20),
            color: primaryRed,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                  onPressed: () => Navigator.pop(context),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Custom Tab Bar Container
          // To make it look like the design (overlapping or just below), we'll put it in a container 
          // that has a white background and top rounded corners? 
          // Looking at the image, it seems to be a white card 'floating' or attached below.
          Container(
            color: primaryRed, // Extension of header background to cover corners if needed
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Expanded(child: _buildTabItem(0, 'Materi')),
                  Expanded(child: _buildTabItem(1, 'Tugas Dan Kuis')),
                ],
              ),
            ),
          ),


          // List Content
          Expanded(
            child: _selectedTabIndex == 0 
              ? ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: meetings.length,
                  itemBuilder: (context, index) {
                    final item = meetings[index];
                    return _buildMeetingCard(item);
                  },
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final item = tasks[index];
                    return _buildTaskCard(item);
                  },
                ),
          ),
        ],
      ),
      // Bottom Navigation Bar similar to others
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
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            currentIndex: 1, // Keep 'Kelas Saya' selected
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
              } else if (index == 1) {
                // Already here or go back to list? Usually just stay or pop to list.
                // For now, let's pop to list to be safe or do nothing.
                Navigator.pop(context);
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

  Widget _buildTabItem(int index, String label) {
    final bool isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: isSelected 
              ? const Border(bottom: BorderSide(color: Colors.black, width: 3))
              : null,
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14, // Adjusted font size
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected ? Colors.black : Colors.grey[600],
          ),
        ),
      ),
    );
  }

  Widget _buildMeetingCard(Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () {
        // Data Logic
        String? desc;
        List<Map<String, dynamic>>? atts;
        List<Map<String, dynamic>>? tsks;

        if (item['title'].toString().contains('Konsep User Interface Design')) {
          desc = "Konsep dasar User Interface Design akan dipelajari bagaimana membangun sebuah Interaction Design pada antarmuka. Interaction ini sangat penting untuk aplikasi berkomunikasi dengan pengguna. Lalu dipelajari juga poin-poin penting pada interaction design seperti visibility, feedback, limitation, consistency dan affordance. Dan terakhir materi conceptual dan perceptual design interaction akan memberikan gambaran bagaimana bentuk dari Interaction.";
          
          atts = [
            {'title': 'Zoom Meeting Syncronous', 'type': 'link', 'isCompleted': true},
            {'title': 'Elemen-elemen Antarmuka Pengguna', 'type': 'pdf', 'isCompleted': true},
            {'title': 'UID Guidelines and Principles', 'type': 'pdf', 'isCompleted': true},
            {'title': 'User Profile', 'type': 'pdf', 'isCompleted': true},
            {'title': 'Principles of User Interface DesignURL', 'type': 'link', 'isCompleted': true},
          ];

          tsks = [
            {
              'title': 'Quiz Review 01',
              'type': 'quiz',
              'isCompleted': true,
              'description': 'Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis. Jangan lupa klik tombol Submit Answer setelah menjawab seluruh pertanyaan.',
              'dueDate': "Kerjakan sebelum hari Jum'at, 26 Februari 2021 jam 23:59 WIB."
            },
            {
              'title': 'Tugas 01 - UID Android Mobile Game',
              'type': 'task',
              'isCompleted': false, // Grey checkmark in image
              'description': '1. Buatlah desain tampilan (antarmuka) pada aplikasi mobile game FPS (First Person Shooter) yang akan menjadi tugas pada mata kuliah Pemrograman Aplikasi Permainan.\n2. Desain yang dibuat harus melingkupi seluruh tampilan pada aplikasi/game, dari pertama kali aplikasi ...........',
              'dueDate': null
            }
          ];
        } else if (item['title'].toString().contains('Interaksi pada User Interface Design')) {
           desc = "Mempelajari interaksi antara pengguna dan sistem, serta elemen-elemen penting dalam desain interaksi. Memahami bagaimana pengguna berinteraksi dengan antarmuka dan bagaimana membuat interaksi tersebut intuitif dan efisien.";
           atts = [
             {'title': 'Video - User Interface Design For Beginner', 'type': 'video', 'isCompleted': false},
             {'title': 'Interaction Design Patterns', 'type': 'pdf', 'isCompleted': false},
             {'title': 'Human Computer Interaction', 'type': 'pdf', 'isCompleted': false},
           ];
           tsks = []; 
        }

        showModalBottomSheet(
          context: context,
          isScrollControlled: true, // Allow full height control
          backgroundColor: Colors.transparent, // Handle background in the sheet
          builder: (context) => DraggableScrollableSheet(
            initialChildSize: 0.9, // Start almost full screen
            minChildSize: 0.5,
            maxChildSize: 0.95,
            builder: (_, controller) => MeetingDetailSheet(
              title: item['title'],
              description: desc,
              attachments: atts,
              tasks: tsks,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row: Badge & Checkbox
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: badgeBlue,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'Pertemuan ${item['id']}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  Icons.check_circle,
                  color: item['isCompleted'] ? const Color(0xFF00C853) : Colors.grey[400],
                  size: 24,
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Title
            Text(
              item['title'],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 24), // Spacing to match design
            // Footer Info
            Text(
              item['info'],
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCard(Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () {
        if (item['title'].toString().contains('Quiz Review 01')) {
           Navigator.push(
             context,
             MaterialPageRoute(builder: (context) => QuizDetailScreen(title: item['title'])),
           );
        } else if (item['title'].toString().contains('Tugas 01')) {
           Navigator.push(
             context,
             MaterialPageRoute(builder: (context) => const TaskDetailScreen()),
           );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row: Badge & Checkbox
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: item['badgeColor'],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    item['type'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  Icons.check_circle,
                  color: item['isCompleted'] ? const Color(0xFF00C853) : Colors.grey[400],
                  size: 24,
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Content Row: Icon & Title
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Use a Stack to make the custom "Quiz" Icon if needed or just use standard icons
                // Image uses a chat bubble with 'Quiz' text for Quizzes, and a clipboard for Tasks.
                // For simplicity, we use Icons but size them up.
                item['customIcon'] == true 
                ? Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Icon(Icons.question_answer_outlined, size: 32, color: Colors.black),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Icon(Icons.assignment_outlined, size: 32, color: Colors.black),
                  ),
                // If we really wanted 'Quiz' text inside bubble, we'd build a custom widget. 
                // Icon(Icons.question_answer) is close enough for rapid proto.
                
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item['customIcon'] == true)
                        // Small "Quiz" text overlay logic if complex, or just Title
                        const SizedBox(height: 0),
                        
                      Text(
                        item['title'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          height: 1.3
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Due Date
            Text(
              'Tenggat Waktu :  ${item['dueDate']}',
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
