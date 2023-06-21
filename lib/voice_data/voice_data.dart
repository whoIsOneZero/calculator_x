import 'package:flutter/foundation.dart';

/// Using 'ChangeNotifier to make state accessible and notify listeners
///when the state changes
class VoiceData extends ChangeNotifier {
  String _voiceText = '';

  String get voiceText => _voiceText;

  void updateVoiceText(String newValue) {
    _voiceText = newValue;
    notifyListeners();
  }
}
