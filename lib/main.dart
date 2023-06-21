import 'package:avatar_glow/avatar_glow.dart';
import 'package:calculator_x/api_s/speech_api.dart';
import 'package:calculator_x/widgets/newhome_page.dart';
import 'package:calculator_x/widgets/theme_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:calculator_x/voice_data/voice_data.dart';

/*///Instantiating VoiceData
final voiceData = VoiceData();*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /*//
  bool voiceListening = false;*/

  @override
  Widget build(BuildContext context) {
    /// To make this display full screen. It will hide status bar and notch.
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    /// Disables autorotate
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
        title: 'CalculatorX',
        debugShowCheckedModeBanner: false,

        /// Theme changes on themeIcon change
        theme: iconBool ? myDarkTheme : myLightTheme,
        home: Scaffold(
          /*floatingActionButtonLocation: FloatingActionButtonLocation.startTop,

          /// Animating the floatingActionButton
          floatingActionButton: AvatarGlow(
            endRadius: 75.0,
            animate: voiceListening,
            duration: const Duration(milliseconds: 2000),
            glowColor: iconBool ? Colors.white : Colors.black,
            repeat: true,
            repeatPauseDuration: const Duration(milliseconds: 1000),
            showTwoGlows: true,
            child: FloatingActionButton(
              backgroundColor: iconBool ? Colors.white : Colors.black,
              onPressed: () {
                toggleRecording();
              },
              child: Icon(
                voiceListening ? Icons.mic : Icons.mic_none,
                color: iconBool ? Colors.black : Colors.white,
              ),
            ),
          ),*/
          appBar: AppBar(
            /// Changes the background color on themeIcon change
            backgroundColor: iconBool ? Colors.black : Colors.white,
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            iconBool = !iconBool;
                            myContainerColor =
                                iconBool ? Colors.black : Colors.white;
                          });
                        },

                        /// Where the themeIcons are changed
                        icon: Icon(
                          iconBool ? iconDark : iconLight,
                          color: iconBool ? Colors.white : Colors.black,
                        )),
                  ],
                ),
              ),
            ],
          ),
          body: const NewHomePage(),
        ));
  }

  /*Future toggleRecording() => SpeechApi.toggleRecording(
        onListening: (isListening) {
          setState(() {
            voiceListening = isListening;
          });
        },
        onResult: (text) => setState(() {
          /// Error here
          voiceData.updateVoiceText(text);
          if (kDebugMode) {
            print(voiceData.voiceText);
          }
        }),
      );*/
}
