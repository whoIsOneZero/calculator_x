import 'package:flutter/material.dart';
import 'icon_buttons.dart';

//A library for parsing and evaluating mathematical expressions.
import 'package:math_expressions/math_expressions.dart';

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
            //color: Colors.amberAccent,
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(answer,
                    style:
                        const TextStyle(fontSize: 35.0, color: Colors.white)),
                const SizedBox(
                  height: 4.0,
                ),
                Text(userInput, style: const TextStyle(fontSize: 50.0)),
              ],
            ),
          )),
          //

          /// The calculator buttons
          Container(
            height: 450,
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
                  child: GridView.builder(
                    itemCount: buttons.length,

                    ///Defines the layout of the grid
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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

                      // +/- button
                      else if (index == 1) {
                        return MyButtons(
                          buttonText: buttons[index],
                          myColor: Colors.blue[50],
                        );
                      }

                      // %Button
                      else if (index == 2) {
                        return MyButtons(
                          buttonTapped: () {
                            setState(() {
                              userInput += buttons[index];
                            });
                          },
                          buttonText: buttons[index],
                          myColor: Colors.blue[50],
                        );
                      }

                      //Delete Button
                      else if (index == 3) {
                        return MyButtons(
                          buttonTapped: () {
                            setState(() {
                              ///Removes the last character from the 'userInput'
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                            });
                          },
                          buttonText: buttons[index],
                          myColor: Colors.blue[50],
                        );
                      }

                      //Equal_to button
                      else if (index == 18) {
                        return MyButtons(
                          buttonTapped: () {
                            setState(() {
                              equalPressed();
                            });
                          },
                          buttonText: buttons[index],
                        );
                      }

                      //  other buttons
                      else {
                        return MyButtons(
                          buttonTapped: () {
                            setState(() {
                              userInput += buttons[index];
                            });
                          },
                          buttonText: buttons[index],
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // function to calculate the input operation
  void equalPressed() {
    String finaluserinput = userInput;

    ///For the multiplication expression
    finaluserinput = userInput.replaceAll('x', '*');

    ///Instantiating the Parser() class
    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);

    ///Instantiating the ContextModel() class
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}
