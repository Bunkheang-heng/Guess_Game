import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  // Background stars effect
                  CustomPaint(
                    size: const Size(double.infinity, double.infinity),
                    painter: StarsPainter(),
                  ),
                  // Character image
                  Center(
                    child: Image.network(
                      'https://media0.giphy.com/media/mDYBgNVs7sBAeDv9Gt/giphy.gif?cid=6c09b9526wxogzso90phtnsolpwfcdkwkd1ybmw4v3dlxbzf&ep=v1_stickers_search&rid=giphy.gif&ct=s',
                      height: 300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                const Text(
                  'សំណួរទី១',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'តើតួអង្គរបស់អ្នកជាមនុស្សប្រុសមែនទេ?',
                  style: TextStyle(
                    fontSize: 18,
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

class StarsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final random = DateTime.now().millisecondsSinceEpoch;
    for (var i = 0; i < 50; i++) {
      final x = (random + i * 100) % size.width;
      final y = (random + i * 200) % size.height;
      canvas.drawCircle(Offset(x, y), 1, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
