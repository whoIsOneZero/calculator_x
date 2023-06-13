import 'package:flutter/material.dart';
import 'icon_buttons.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key}) : super(key: key);

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  var userInput = '';
  var answer = '';

  // Array of button
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
    '0',
    '.',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(88.0, 50.0),
                      backgroundColor: Colors.blueGrey[900],
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.light_mode_outlined)),
                        const SizedBox(
                          width: 2.0,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.dark_mode_outlined)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          ///For the output
          Expanded(
              child: Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("2+3", style: TextStyle(fontSize: 35.0)),
                const SizedBox(
                  height: 4.0,
                ),
                Text("4", style: const TextStyle(fontSize: 50.0)),
              ],
            ),
          )),
          //

          /// The calculator buttons
          Container(
            height: 360,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(24.0),
                topLeft: Radius.circular(24.0),
              ),
              color: Colors.blueGrey[900],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                          itemBuilder: (BuildContext context, int index) {
                            // Clear Button
                            if (index == 0) {
                              return MyButtons(
                                buttonTapped: () {
                                  setState(() {
                                    userInput = '';
                                    answer = '0';
                                  });
                                },
                                buttonText: buttons[index],
                                myColor: Colors.blue[50],
                              );
                            }
                          }),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
