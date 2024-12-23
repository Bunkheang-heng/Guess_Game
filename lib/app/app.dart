import 'package:flutter/material.dart';
import '../home/getStart.dart';
import '../services/audio_service.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AudioService _audioService = AudioService();

  @override
  void initState() {
    super.initState();
    _audioService.playBackgroundMusic();
  }

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF4169E1),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFFFF4040),
        ),
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Freehand',
            ),
      ),
      home: const GetStart(),
    );
  }
}
