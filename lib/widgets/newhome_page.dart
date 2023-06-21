import 'package:avatar_glow/avatar_glow.dart';
import 'package:calculator_x/widgets/theme_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../api_s/speech_api.dart';
import 'icon_buttons.dart';
import 'calculator_logic.dart';
import 'operation_values.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:calculator_x/voice_data/voice_data.dart';

///Instantiating VoiceData
final voiceData = VoiceData();

///Instantiating OperationValues
final operationValues = OperationValues();

class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key}) : super(key: key);

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  //
  bool voiceListening = false;

  /// Flag to track if speech-to-text operation is completed
  bool isRecordingComplete = false;

  //
  /// The getter methods from the operationValues instance
  String get voiceText => voiceData.voiceText;

  ///For the Text-to-Speech
  FlutterTts ftts = FlutterTts();

  /// The getter methods from the operationValues instance
  String get userInput => operationValues.userInput;

  String get answer => operationValues.answer;

  /// Array of button values
  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '.',
    '0',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,

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
            onPressed: () async {
              await toggleRecording();
              await runTextToSpeech();
            },
            child: Icon(
              voiceListening ? Icons.mic : Icons.mic_none,
              color: iconBool ? Colors.black : Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            /*ElevatedButton(
              */ /*onPressed: () async {
                /// Custom configuration
                await ftts.setLanguage("en-US");
                await ftts.setSpeechRate(0.5); //speed of speech
                await ftts.setVolume(1.0); //volume of speech
                await ftts.setPitch(1); //pitch of sound

                /// Play text to speech
                /// This is where I want to put 'voiceText'
                var result = await ftts.speak("Hello World");
                if (result == 1) {
                  //speaking
                } else {
                  //not speaking
                }
              },*/ /*
              onPressed: () {},
              child: const Text("TTs"),
            ),*/

            ///Where the answers will be displayed
            Expanded(
                child: Container(
              margin: const EdgeInsets.only(left: 2.0, right: 1.0),
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          userInput,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontSize: 35.0),
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          answer,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontSize: 50.0),
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
            //

            /// The calculator buttons
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 4.0, left: 8.0, right: 4.0),
              child: Container(
                ///Responsiveness
                height: MediaQuery.of(context).size.height * 0.575,
                margin: const EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(24.0),
                    topLeft: Radius.circular(24.0),
                  ),

                  ///Behind the buttons
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 3,
                      child: GridView.builder(
                        itemCount: buttons.length,

                        ///Defines the layout of the grid
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4),
                        itemBuilder: (BuildContext context, int index) {
                          /// Clear Button
                          if (index == 0) {
                            return MyButtons(
                              buttonTapped: () {
                                setState(() {
                                  ///Set the values to zero
                                  operationValues.updateUserInput('');
                                  operationValues.updateAnswer('0');
                                });
                              },
                              buttonText: buttons[index],
                              myColor: Colors.green,
                            );
                          }

                          /// +/- button
                          ///TODO: Implement functionality here or change it.
                          else if (index == 1) {
                            return MyButtons(
                              buttonText: buttons[index],
                              myColor: Colors.green,
                            );
                          }

                          /// %Button
                          else if (index == 2) {
                            return MyButtons(
                              buttonTapped: () {
                                setState(() {
                                  ///Display the value
                                  operationValues.updateUserInput(
                                      userInput + buttons[index]);

                                  ///Converting to percentage
                                  double percentage = double.parse(userInput
                                      .substring(0, userInput.length - 1));
                                  percentage /= 100;
                                  operationValues
                                      .updateUserInput(percentage.toString());
                                });
                              },
                              buttonText: buttons[index],
                              myColor: Colors.green,
                            );
                          }

                          /// DEL Button
                          else if (index == 3) {
                            return MyButtons(
                              buttonTapped: () {
                                setState(() {
                                  ///Removes the last character from the 'userInput'
                                  if (userInput.isNotEmpty) {
                                    operationValues.updateUserInput(userInput
                                        .substring(0, userInput.length - 1));
                                  } else {
                                    operationValues
                                        .updateUserInput(0.toString());
                                  }
                                });
                              },
                              buttonText: buttons[index],
                              myColor: Colors.green,
                            );
                          }

                          /// ' = 'button
                          else if (index == 18) {
                            return MyButtons(
                              buttonTapped: () {
                                setState(() {
                                  operationValues
                                      .updateAnswer(equalPressed(userInput));
                                });
                              },
                              buttonText: buttons[index],
                              myColor: Colors.red,
                            );
                          }

                          ///  other buttons
                          else {
                            return MyButtons(
                              buttonTapped: () {
                                setState(() {
                                  operationValues.updateUserInput(
                                      userInput + buttons[index]);
                                });
                              },
                              buttonText: buttons[index],
                              myColor: (isOperator(buttons[index])
                                  ? Colors.red
                                  : Theme.of(context).primaryColorDark),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  bool isAction(String y) {
    if (y == 'C' || y == 'DEL' || y == '+/-' || y == '%') {
      return true;
    }
    return false;
  }

  Future toggleRecording() => SpeechApi.toggleRecording(
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
      );

  Future<void> runTextToSpeech() async {
    /// Custom configuration
    await ftts.setLanguage("en-US");
    await ftts.setSpeechRate(0.5); //speed of speech
    await ftts.setVolume(1.0); //volume of speech
    await ftts.setPitch(1); //pitch of sound

    /// Play text to speech
    /// This is where I want to put 'voiceText'
    var result = await ftts.speak("Hello World");
    if (result == 1) {
      //speaking
    } else {
      //not speaking
    }
  }
}
