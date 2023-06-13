import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

String output = "0";
String _answer = "0";
double num1 = 0.0;
double num2 = 0.0;
String operand = "";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                Text(output, style: const TextStyle(fontSize: 50.0)),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Buttons(buttonText: 'C', myColor: Colors.green),
                    Buttons(buttonText: '+/-', myColor: Colors.green),
                    Buttons(buttonText: '%', myColor: Colors.green),
                    Buttons(buttonText: '÷', myColor: Colors.red),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Buttons(buttonText: '7'),
                    Buttons(buttonText: '8'),
                    Buttons(buttonText: '9'),
                    Buttons(buttonText: 'x', myColor: Colors.red),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Buttons(buttonText: '4'),
                    Buttons(buttonText: '5'),
                    Buttons(buttonText: '6'),
                    Buttons(buttonText: '–', myColor: Colors.red),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Buttons(buttonText: '1'),
                    Buttons(buttonText: '2'),
                    Buttons(buttonText: '3'),
                    Buttons(buttonText: '+', myColor: Colors.red),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    //Buttons(myIcon: const Icon(Icons.undo, color: Colors.red), buttonText: '←'),
                    Buttons(

                        ///TODO: font size not changed yet
                        buttonText: '←',
                        myColor: Colors.red,
                        myFontSize: 30.0),
                    Buttons(buttonText: '0'),
                    Buttons(buttonText: '.'),
                    Buttons(buttonText: '=', myColor: Colors.red),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*class Buttons extends StatelessWidget {
  final String buttonText;
  final Color? myColor;
  final Icon? myIcon;
  final double? myFontSize;

  ///The constructor
  const Buttons({
    Key? key,
    required this.buttonText,
    this.myColor,
    this.myIcon,
    this.myFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = _HomePageState();
    return SizedBox(
      height: 65,
      width: 65,
      child: ElevatedButton(
        onPressed: () {
          ///Created and instantiation of the class
          value.operation(buttonText);

          ///For debugging
          if (kDebugMode) {
            print(value.output);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black38,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
        ),
        child: myIcon ??
            Text(
              buttonText,
              style: TextStyle(
                  fontSize: myFontSize ?? 26.0, color: myColor ?? Colors.white),
            ),
      ),
    );
  }
}*/

class Buttons extends StatefulWidget {
  final String buttonText;
  final Color? myColor;
  final Icon? myIcon;
  final double? myFontSize;

  ///The constructor
  const Buttons({
    Key? key,
    required this.buttonText,
    this.myColor,
    this.myIcon,
    this.myFontSize,
  }) : super(key: key);

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    //Just brought this here
    ///
    operation(String btnText) {
      ///For Clear
      if (btnText == "C") {
        _answer = "0";
        num1 = 0.0;
        num2 = 0.0;
        operand = "";
        //
      } else if (btnText == "+" ||
          btnText == "-" ||
          btnText == "x" ||
          btnText == "÷") {
        num1 = double.parse(output);

        ///Because the buttonText(s) are of type int
        //
        /// Fetching the operand
        operand = btnText;
        _answer = "0";
      } else if (btnText == "=") {
        num2 = double.parse(output);

        if (operand == "+") {
          _answer = (num1 + num2).toString();
        }
        if (operand == "x") {
          _answer = (num1 * num2).toString();
        }
        if (operand == "-") {
          _answer = (num1 - num2).toString();
        }
        if (operand == "÷") {
          _answer = (num1 / num2).toString();
        }

        ///After performing the operation
        num1 = 0.0;
        num2 = 0.0;
        operand = "";
      } else {
        _answer = _answer + btnText;

        ///Added this while debugging
        output = _answer;
      }
      setState(() {
        output = double.parse(_answer).toStringAsFixed(2);
      });
    }

    ///
    return SizedBox(
      height: 65,
      width: 65,
      child: ElevatedButton(
        onPressed: () {
          operation(widget.buttonText);

          ///For debugging
          if (kDebugMode) {
            print(output);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black38,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
        ),
        child: widget.myIcon ??
            Text(
              widget.buttonText,
              style: TextStyle(
                  fontSize: widget.myFontSize ?? 26.0,
                  color: widget.myColor ?? Colors.white),
            ),
      ),
    );
  }
}
