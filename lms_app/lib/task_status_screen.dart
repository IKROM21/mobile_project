import 'package:flutter/material.dart';
import 'package:lms_app/task_detail_screen.dart'; // import if needed for navigating back or re-using logic/styles

class TaskStatusScreen extends StatelessWidget {
  final String fileName;

  const TaskStatusScreen({
    super.key, 
    required this.fileName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Tugas 01 - UID Android Mobile Game',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        backgroundColor: const Color(0xFFA91D22),
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Status Card Container
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF9F9F9),
                borderRadius: BorderRadius.circular(12),
                // boxshadow?
              ),
              child: Column(
                children: [
                  // Header
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    decoration: const BoxDecoration(
                      color: Color(0xFFEF5350), // Red lighter than appbar or same? Image looks slighly lighter/different maybe. using distinct red.
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Status Tugas',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  
                  // Rows
                  _buildStatusRow('Status', 'Sudah Mengirim untuk di nilai', 0),
                  _buildStatusRow('Status Nilai', 'Belum Di nilai', 1),
                  _buildStatusRow('Batas tanggal', 'Jumat, 26 Februari 2021, 23:59 WIB', 0),
                  _buildSisaWaktuRow(1),
                  _buildFileRow(0),
                ],
              ),
            ),
            
            const SizedBox(height: 40),
            
            // Button
            SizedBox(
              width: 180,
              child: ElevatedButton(
                onPressed: () {
                   // Logic to 'Edit Submission' or similar. 
                   // For now just pop or show uploads again.
                   Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF5F5F5),
                  foregroundColor: Colors.black87,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text(
                  'Tambahkan Tugas',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusRow(String label, String value, int index) {
    Color bgColor = index % 2 == 0 ? const Color(0xFFF5F5F5) : Colors.white;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      color: bgColor,
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

  Widget _buildSisaWaktuRow(int index) {
    Color bgColor = index % 2 == 0 ? const Color(0xFFF5F5F5) : Colors.white;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      color: bgColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 140,
            child: Text(
              "Sisa Waktu",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.blue, width: 2)) // Underline simulation
              ),
              child: const Text(
                'Tugas sudah di kirim 4 Hari 6 Jam Sebelum nya',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black87, // Image text is black but underlined blue?
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFileRow(int index) {
    Color bgColor = index % 2 == 0 ? const Color(0xFFF5F5F5) : Colors.white;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: bgColor,
         borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 140,
            child: Text(
              "File Tugas",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                 const Icon(Icons.picture_as_pdf, size: 24, color: Colors.black54),
                 const SizedBox(width: 8),
                 Expanded(
                   child: Text(
                    fileName,
                    style: const TextStyle(fontSize: 13),
                    overflow: TextOverflow.ellipsis,
                   ),
                 ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
