import 'package:flutter/material.dart';

class MaterialViewerScreen extends StatelessWidget {
  final String title;

  const MaterialViewerScreen({
    super.key, 
    this.title = 'Pengantar User Interface Design',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0), // Grey background behind slides
      appBar: AppBar(
        backgroundColor: const Color(0xFFA91D22),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              border: Border.all(color: Colors.black54),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Halaman\n 1/26',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black, 
                fontSize: 10,
                fontWeight: FontWeight.bold,
                height: 1
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSlide1(),
            const SizedBox(height: 16),
            _buildSlide2(),
            const SizedBox(height: 16),
            _buildSlide3(),
            const SizedBox(height: 16),
            _buildSlide4(),
          ],
        ),
      ),
    );
  }

  Widget _buildSlideBase({required Widget child}) {
    return Container(
      width: double.infinity,
      // Aspect ratio of a slide roughly 4:3 or 16:9? Image looks like A4 portrait roughly?
      // Actually they look landscape in content but cropped? 
      // No, looking at the hierarchy they seem to be landscape slides viewed on a phone (so small).
      // Or maybe portrait slides.
      // Let's rely on content height.
      constraints: const BoxConstraints(minHeight: 200),
      color: Colors.white,
      child: Stack(
        children: [
          // Background decorations (Pink shapes)
          Positioned(
            top: -50,
            left: -50,
            child: Transform.rotate(
              angle: 0.5,
              child: Container(
                width: 200, 
                height: 100, 
                color: Colors.pink.withOpacity(0.1),
              ),
            ),
          ),
           Positioned(
            bottom: -50,
            right: -50,
            child: Transform.rotate(
              angle: -0.5,
              child: Container(
                width: 200, 
                height: 200, 
                color: Colors.pink.withOpacity(0.05),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _buildSlide1() {
    return _buildSlideBase(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               // Left Abstract Graphic simulation
               Row(
                 children: [
                   Container(width: 40, height: 60, color: Colors.pink),
                   const SizedBox(width: 4),
                   Container(width: 30, height: 50, color: Colors.pink[200]),
                 ],
               ),
               // University Logo Simulation
               Column(
                 children: [
                   Icon(Icons.school, size: 50, color: Colors.grey[800]),
                   const Text(
                     'Universitas',
                     style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                   ),
                   const Text(
                     'Telkom',
                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, height: 0.8),
                   ),
                 ],
               )
            ],
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            color: const Color(0xFF333333), // Dark grey
            child: Row(
               children: [
                 Expanded(
                   child: const Text(
                      'Pengantar Desain\nAntarmuka Pengguna',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                   ),
                 ),
                 Container(width: 1, height: 40, color: Colors.grey),
                 const SizedBox(width: 8),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: const [
                     Text('VEI214', style: TextStyle(color: Colors.red, fontSize: 10)),
                     Text('UI / UX Design', style: TextStyle(color: Colors.red, fontSize: 10)),
                   ],
                 )
               ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSlide2() {
    return _buildSlideBase(
      child: Column(
        children: [
          const Text(
            'Perkenalan',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Photo Placeholder
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('• Ady Purna Kurniawan -> ADY', style: TextStyle(fontSize: 11)),
                    SizedBox(height: 4),
                    Text('• E-mail:\n  adypurnakurniawan@telkomuniversity.ac.id', style: TextStyle(fontSize: 11)),
                    SizedBox(height: 4),
                    Text('• Bidang Keahlian:', style: TextStyle(fontSize: 11)),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('– Information System\n– Web Programming and Design\n– Game Development', style: TextStyle(fontSize: 11)),
                    ),
                     SizedBox(height: 4),
                    Text('• No.HP: 085727930642 -> SMS/Telp/Whatsapp', style: TextStyle(fontSize: 11)),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSlide3() {
    return _buildSlideBase(
      child: Column(
        children: [
           const Text(
            'User Interface',
            style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            '• Antarmuka/ user interface (UI) merupakan bagian dari komputer dan perangkat lunaknya yang dapat dilihat, didengar, disentuh, dan diajak bicara, baik secara langsung maupun dengan proses pemahaman tertentu.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 11),
          ),
          const SizedBox(height: 8),
          const Text(
            '• UI yang baik adalah UI yang tidak disadari, dan UI yang memungkinkan pengguna fokus pada informasi dan task tanpa perlu mengetahui mekanisme untuk menampilkan informasi dan melakukan task tersebut.',
             textAlign: TextAlign.justify,
             style: TextStyle(fontSize: 11),
          ),
           const SizedBox(height: 8),
           Align(
             alignment: Alignment.centerLeft,
             child: const Text(
              '• Komponen utamanya:\n   – Input\n   – Output',
              style: TextStyle(fontSize: 11),
             ),
           ),
        ],
      ),
    );
  }

  Widget _buildSlide4() {
    return _buildSlideBase(
      child: Column(
        children: [
           const Text(
            'Pentingnya Desain UI yang Baik',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
           const SizedBox(height: 16),
           const Text(
            '• Banyak sistem dengan fungsionalitas yang baik tapi tidak efisien, membingungkan, dan tidak berguna karena desain UI yang buruk',
             textAlign: TextAlign.justify,
             style: TextStyle(fontSize: 11),
           ),
           const SizedBox(height: 8),
           const Text(
            '• Antarmuka yang baik merupakan jendela untuk melihat kemampuan sistem serta jembatan bagi kemampuan perangkat lunak',
             textAlign: TextAlign.justify,
             style: TextStyle(fontSize: 11),
           ),
            const SizedBox(height: 8),
           Row(
             crossAxisAlignment: CrossAxisAlignment.end,
             children: [
               Expanded(
                 child: const Text(
                  '• Desain yang buruk akan membingungkan, tidak efisien, bahkan menyebabkan frustasi',
                   textAlign: TextAlign.justify,
                   style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                 ),
               ),
               const SizedBox(width: 8),
               Container(
                 width: 80, 
                 height: 60,
                 color: Colors.grey,
                 child: const Icon(Icons.computer, color: Colors.white),
               )
             ],
           )
        ],
      ),
    );
  }
}
