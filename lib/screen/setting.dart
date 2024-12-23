import 'package:flutter/material.dart';
import '../services/audio_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final AudioService _audioService = AudioService();
  double _soundVolume = 0.5;
  double _musicVolume = 0.5;
  String _selectedLanguage = 'ខ្មែរ';
  String _selectedMusic = 'ការដូគ្មានន័យ';

  final Map<String, String> _musicTrackPaths = {
    'ការដូគ្មានន័យ': 'background.mp3',
    'ស្នែហាក្នុងពេលរាត្រី': 'background1.mp3',
    'ដើមឈើស្នែហ': 'background2.mp3',
    'BC Zin': 'background3.mp3',
  };

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
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                    const Text(
                      'ការកំណត់',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                _buildSettingCard(
                  'សំឡេង',
                  Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.volume_up, color: Colors.white),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Slider(
                              value: _soundVolume,
                              onChanged: (value) {
                                setState(() {
                                  _soundVolume = value;
                                });
                              },
                              activeColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _buildSettingCard(
                  'តន្ត្រី',
                  Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.music_note, color: Colors.white),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Slider(
                              value: _musicVolume,
                              onChanged: (value) async {
                                setState(() {
                                  _musicVolume = value;
                                });
                                await _audioService.setVolume(value);
                              },
                              activeColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ListTile(
                        leading:
                            const Icon(Icons.queue_music, color: Colors.white),
                        title: DropdownButton<String>(
                          value: _selectedMusic,
                          dropdownColor: const Color(0xFF4169E1),
                          style: const TextStyle(color: Colors.white),
                          items: _musicTrackPaths.keys.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 16),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) async {
                            if (newValue != null) {
                              setState(() {
                                _selectedMusic = newValue;
                              });
                              await _audioService.playBackgroundMusic(
                                  _musicTrackPaths[newValue]!);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _buildSettingCard(
                  'ភាសា',
                  Column(
                    children: [
                      ListTile(
                        leading:
                            const Icon(Icons.language, color: Colors.white),
                        title: DropdownButton<String>(
                          value: _selectedLanguage,
                          dropdownColor: const Color(0xFF4169E1),
                          style: const TextStyle(color: Colors.white),
                          items: ['ខ្មែរ', 'English'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 16),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedLanguage = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingCard(String title, Widget content) {
    return Container(
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
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          content,
        ],
      ),
    );
  }
}
