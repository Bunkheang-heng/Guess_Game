import 'package:audioplayers/audioplayers.dart';

class AudioService {
  // Singleton instance
  static final AudioService _instance = AudioService._internal();

  factory AudioService() {
    return _instance;
  }

  AudioService._internal() {
    _init();
  }

  static const List<String> backgroundTracks = [
    'background.mp3',
    'background1.mp3',
    'background2.mp3',
    'background3.mp3',
  ];

  final AudioPlayer _backgroundMusicPlayer = AudioPlayer();
  String _currentTrack = backgroundTracks[0];
  double _volume = 0.5;
  bool _isPlaying = false;

  Future<void> _init() async {
    await _backgroundMusicPlayer.setVolume(_volume);
    await _backgroundMusicPlayer.setReleaseMode(ReleaseMode.loop);
    await playBackgroundMusic();
  }

  Future<void> playBackgroundMusic([String? track]) async {
    try {
      // Stop current music if playing
      if (_isPlaying) {
        await _backgroundMusicPlayer.stop();
      }

      // Update track if a new one is provided
      if (track != null) {
        _currentTrack = track;
      }

      // Set volume and play
      await _backgroundMusicPlayer.setVolume(_volume);
      await _backgroundMusicPlayer.play(AssetSource(_currentTrack));
      _isPlaying = true;
    } catch (e) {
      print('Error playing background music: $e');
      _isPlaying = false;
    }
  }

  Future<void> setVolume(double volume) async {
    _volume = volume;
    try {
      await _backgroundMusicPlayer.setVolume(volume);
    } catch (e) {
      print('Error setting volume: $e');
    }
  }

  Future<void> stopBackgroundMusic() async {
    try {
      await _backgroundMusicPlayer.stop();
      _isPlaying = false;
    } catch (e) {
      print('Error stopping background music: $e');
    }
  }

  Future<void> dispose() async {
    try {
      await stopBackgroundMusic();
      await _backgroundMusicPlayer.dispose();
    } catch (e) {
      print('Error disposing audio player: $e');
    }
  }
}
