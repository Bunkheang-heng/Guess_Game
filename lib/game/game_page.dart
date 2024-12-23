import 'package:flutter/material.dart';
import 'components/question_card.dart';
import 'components/answer_buttons.dart';
import 'components/game_header.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int questionNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4169E1),
              Colors.purple,
              Color(0xFFFF6B6B),
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const GameHeader(),
              const Expanded(
                child: QuestionCard(),
              ),
              const AnswerButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
