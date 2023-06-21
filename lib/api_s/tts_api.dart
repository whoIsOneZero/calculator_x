import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

Future<void> textToSpeech(String text) async {
  FlutterTts ftts = FlutterTts();

  /// Your custom configuration
  await ftts.setLanguage("en-US");
  await ftts.setSpeechRate(0.5); //speed of speech
  await ftts.setVolume(1.0); //volume of speech
  await ftts.setPitch(1); //pitch of sound

  /// Play text to speech
  var result = await ftts.speak(text);
  if (result == 1) {
    /// Speaking
  } else {
    /// Not speaking
  }
}
