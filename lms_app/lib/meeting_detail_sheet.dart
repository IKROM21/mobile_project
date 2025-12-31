import 'package:flutter/material.dart';
import 'package:lms_app/quiz_detail_screen.dart';
import 'package:lms_app/material_viewer_screen.dart'; // Keep if used for others
import 'package:lms_app/task_detail_screen.dart';
import 'package:lms_app/video_player_screen.dart';

class MeetingDetailSheet extends StatefulWidget {
  final String title;
  final String? description;
  final List<Map<String, dynamic>>? attachments;
  final List<Map<String, dynamic>>? tasks;
  
  const MeetingDetailSheet({
    super.key, 
    required this.title,
    this.description,
    this.attachments,
    this.tasks,
  });

  @override
  State<MeetingDetailSheet> createState() => _MeetingDetailSheetState();
}

class _MeetingDetailSheetState extends State<MeetingDetailSheet> {
  int _selectedTabIndex = 0; // 0: Lampiran Materi, 1: Tugas dan Kuis

  // Default data fallback
  final String defaultDesc = 'Antarmuka yang dibangun harus memperhatikan prinsip-prinsip desain yang ada. Hal ini diharapkan agar antarmuka yang dibangun bukan hanya menarik secara visual tetapi dengan memperhatikan kaidah-kaidah prinsip desain diharapkan akan mendukung pengguna dalam menggunakan produk secara baik. Pelajaran mengenai prinsip UID ini sudah pernah diajarkan dalam mata kuliah Implementasi Desain Antarmuka Pengguna tetap pada matakuliah ini akan direview kembali sehingga dapat menjadi bekal saat memasukki materi mengenai User Experience';

  final List<Map<String, dynamic>> defaultAttachments = [
    {
      'title': 'Zoom Meeting Syncronous',
      'type': 'link',
      'isCompleted': true,
    },
    {
      'title': 'Pengantar User Interface Design',
      'type': 'pdf',
      'isCompleted': false,
    },
    {
      'title': 'Empat Teori Dasar Antarmuka Pengguna',
      'type': 'pdf',
      'isCompleted': false,
    },
    {
      'title': 'Empat Teori Dasar Antarmuka Pengguna',
      'type': 'pdf',
      'isCompleted': true,
    },
    {
      'title': 'User Interface Design for Beginner',
      'type': 'video', 
      'isCompleted': true,
    },
    {
      'title': '20 Prinsip Desain',
      'type': 'link',
      'isCompleted': true,
    },
    {
      'title': 'Best Practice UI Design',
      'type': 'link',
      'isCompleted': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Use min so it doesn't take full height if not needed, but Scrollable usually needs constraints
        children: [
          // Handle Bar
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2.5),
            ),
          ),
          const SizedBox(height: 20),
          
          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 20),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Deskripsi
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Deskripsi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      widget.description ?? defaultDesc,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Tabs
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                    ),
                    child: Row(
                      children: [
                        Expanded(child: _buildTabItem(0, 'Lampiran Materi')),
                        Expanded(child: _buildTabItem(1, 'Tugas dan Kuis')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  
                  // Content List
                  if (_selectedTabIndex == 0) ...[
                    Builder(
                      builder: (context) {
                        final data = widget.attachments ?? defaultAttachments;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return _buildAttachmentCard(data[index]);
                          },
                        );
                      }
                    ),
                  ]
                  else ...[
                    // TUGAS & KUIS
                    if (widget.tasks != null && widget.tasks!.isNotEmpty)
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        itemCount: widget.tasks!.length,
                        itemBuilder: (context, index) {
                          return _buildTaskCard(widget.tasks![index]);
                        },
                      )
                    else
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Center(child: Text('Belum ada Tugas/Kuis untuk pertemuan ini.')),
                      ),
                  ],
                ],
              ),
            ),
          ),
        ],
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
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: isSelected 
              ? const Border(bottom: BorderSide(color: Colors.black, width: 3))
              : null,
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected ? Colors.black : Colors.grey[600],
          ),
        ),
      ),
    );
  }

  Widget _buildAttachmentCard(Map<String, dynamic> item) {
    IconData iconData;
    switch (item['type']) {
      case 'link':
        iconData = Icons.link;
        break;
      case 'pdf':
        iconData = Icons.description_outlined;
        break;
      case 'video':
        iconData = Icons.play_circle_fill;
        break;
      default:
        iconData = Icons.insert_drive_file_outlined;
    }

    return GestureDetector(
      onTap: () {
        if (item['type'] == 'video' || item['title'].toString().contains('Video')) {
           Navigator.push(
             context,
             MaterialPageRoute(builder: (context) => const VideoPlayerScreen()),
           );
        } else if (item['type'] == 'link' && item['title'].toString().contains('Interaksi')) {
           Navigator.push(
             context,
             MaterialPageRoute(builder: (context) => const VideoPlayerScreen()),
           );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text('Opening ${item['title']}')),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30), // Rounded pill shape as per image
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(iconData, size: 24, color: item['type'] == 'video' ? const Color(0xFFA91D22) : Colors.black87),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                item['title'],
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
               decoration: const BoxDecoration(
                 shape: BoxShape.circle,
                 color: Colors.white
               ),
               child: Icon(
                  Icons.check_circle,
                  color: item['isCompleted'] ? const Color(0xFF00C853) : Colors.grey[300],
                  size: 24,
                ),
            )
          ],
        ),
      ),
    );
  }
  Widget _buildTaskCard(Map<String, dynamic> item) {
    bool isQuiz = item['type'] == 'quiz';
    
    return GestureDetector(
      onTap: () {
        if (item['title'].toString().contains('Quiz Review 01')) { // Basic check
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
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300),
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
            // Header: Title + Checkbox
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      item['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Container(
                     decoration: const BoxDecoration(
                       shape: BoxShape.circle,
                       color: Colors.white
                     ),
                     child: Icon(
                        Icons.check_circle,
                        color: item['isCompleted'] ? const Color(0xFF00C853) : Colors.grey[300],
                        size: 24,
                      ),
                  )
                ],
              ),
            ),
            
            const Divider(height: 1, thickness: 1, color: Colors.grey),
            
            // Body
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child:  isQuiz 
                      ? const Icon(Icons.quiz_outlined, size: 28, color: Colors.black87)
                      : const Icon(Icons.edit_note, size: 32, color: Colors.black87),
                  ),
                  const SizedBox(width: 16),
                  
                  // Description & Due Date
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['description'],
                          style: const TextStyle(
                            fontSize: 12,
                            height: 1.4,
                            color: Colors.black87,
                          ),
                        ),
                        if (item['dueDate'] != null) ...[
                          const SizedBox(height: 8),
                          Text(
                            item['dueDate'],
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ]
                      ],
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
