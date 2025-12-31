import 'package:flutter/material.dart';

class VideoPlayerScreen extends StatelessWidget {
  final String title;

  const VideoPlayerScreen({
    super.key, 
    this.title = 'Video - User Interface Design For Beginner',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        backgroundColor: const Color(0xFFA91D22),
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Video Player Area (Simulation)
            Container(
              width: double.infinity,
              height: 220,
              color: Colors.black,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Placeholder Image
                  Container(
                    width: double.infinity,
                    height: double.infinity, 
                    color: Colors.grey[900], // Dark background if image fails
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.monitor, size: 50, color: Colors.white24),
                      ],
                    ),
                  ),
                  // Simulation of Thumbnail or Video Content
                  // Since we don't have the actual YouTube thumbnail URL, we can use a colored box or text
                  // But the user provided an image. Let's try to mimic the "UI DESIGN" overlay.
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.black54, // Overlay default
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        color: Colors.black,
                        child: const Text(
                          "UI\nDESIGN",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white, 
                            fontWeight: FontWeight.w900,
                            fontSize: 40,
                            letterSpacing: 5
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Play Button
                  const Icon(Icons.play_circle_fill, color: Colors.red, size: 60),
                  // Bottom Control Bar Simulation
                  Positioned(
                    bottom: 0,
                    left: 0, 
                    right: 0,
                    child: Container(
                      height: 4, 
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Video Lain Nya',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            // List of other videos
            _buildVideoItem(
              context, 
              title: "Interaction Design",
              color: Colors.blue[100]!, // Placeholder color
            ),
            _buildVideoItem(
              context, 
              title: "Pengantar Desain Antarmuka Pengguna",
              color: Colors.grey[200]!,
               isTelkom: true,
            ),
            _buildVideoItem(
              context, 
              title: "4 Teori Dasar Desain Antarmuka Pengguna",
              color: Colors.grey[200]!,
              isTelkom: true,
            ),
            _buildVideoItem(
              context, 
              title: "Tutorial Dasar Figma - UI/UX Design Software",
              color: const Color(0xFF2C3E50), // Dark color for Figma like
              isFigma: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoItem(BuildContext context, {required String title, required Color color, bool isTelkom = false, bool isFigma = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Tighter padding
      color: const Color(0xFFF5F5F5), // Light grey background for each item
      child: Row(
        children: [
          // Thumbnail
          Container(
            width: 140,
            height: 80,
            color: Colors.black,
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Inner Content
                if (isTelkom)
                   Container(
                     color: Colors.white,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Icon(Icons.school, color: Colors.red[800], size: 30),
                         const Text("Universitas\nTelkom", textAlign: TextAlign.center, style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold)),
                       ],
                     ),
                   )
                else if (isFigma)
                   Container(
                     color: const Color(0xFF1E1E1E),
                     child: const Center(child: Text("Figma", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                   )
                else
                   Container(
                     color: Colors.blue[300], // Generic Person
                     child: const Icon(Icons.person, color: Colors.white, size: 40),
                   ),

                // Play icon overlay
                Center(
                  child: Icon(Icons.play_circle_fill, color: Colors.red.withOpacity(0.8), size: 30),
                )
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Title
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
