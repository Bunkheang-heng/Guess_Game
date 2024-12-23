import 'package:flutter/material.dart';
import 'aboutdeveloper.dart';
class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF4169E1), Color(0xFF8A2BE2)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      ),
                      const Text(
                        'អំពីពួកយើង',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 800),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Hero(
                                  tag: 'mascot',
                                  child: Image.network(
                                    'https://en.akinator.com/assets/img/akitudes_520x650/defi.png',
                                    height: 180,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                ShaderMask(
                                  shaderCallback: (bounds) => const LinearGradient(
                                    colors: [Colors.white, Color(0xFFFFC107)],
                                  ).createShader(bounds),
                                  child: const Text(
                                    'ល្បែងទាយតួរអង្គ',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 32),
                  _buildInfoCard(
                    'បេសកកម្មរបស់យើង',
                    'យើងមានបំណងផ្តល់នូវបទពិសោធន៍ល្បែងដ៏គួរឱ្យរំភើប និងមានការអប់រំសម្រាប់អ្នកប្រើប្រាស់គ្រប់វ័យ។',
                    Icons.rocket_launch,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    'ចក្ខុវិស័យរបស់យើង',
                    'ក្លាយជាកម្មវិធីល្បែងកម្សាន្តដែលគេពេញនិយមបំផុតនៅកម្ពុជា ដោយផ្តល់នូវមាតិកាដែលមានគុណភាពខ្ពស់។',
                    Icons.visibility,
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      // Navigate to developer page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutDeveloper(),
                        ),
                      );
                    },
                    child: _buildInfoCard(
                      'អ្នកអភិវឌ្ឍន៍',
                      'ស្វែងយល់បន្ថែមអំពីអ្នកអភិវឌ្ឍន៍នៃកម្មវិធីនេះ',
                      Icons.code,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            'ទំនាក់ទំនង',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.email, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                'bunkheangheng99@gmail.com',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Times New Roman',
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String description, IconData icon) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 800),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(icon, color: Colors.white, size: 24),
                      const SizedBox(width: 12),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
