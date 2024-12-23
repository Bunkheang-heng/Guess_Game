import 'package:flutter/material.dart';

class AnswerButtons extends StatelessWidget {
  const AnswerButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildAnswerButton(
                  'ប្រហែលជា',
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildAnswerButton(
                  'ប្រហែលជាមិនមែន',
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _buildAnswerButton(
                  'បាទ/ចាស',
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildAnswerButton(
                  'មិនដឹង',
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildAnswerButton(
                  'ទេ',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerButton(String text, {required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFFD700),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
