import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
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
                      backgroundColor: Colors.black38,
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Icon(Icons.wb_sunny_outlined),
                          SizedBox(
                            width: 12.0,
                          ),
                          Icon(Icons.nightlight_outlined),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 150.0,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16.0),
                  topLeft: Radius.circular(16.0),
                ),
                color: Colors.blueGrey[900],
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Buttons(buttonText: '7', onPressed: () {}),
                          Buttons(buttonText: '8', onPressed: () {}),
                          Buttons(buttonText: '9', onPressed: () {}),
                          Buttons(buttonText: 'X', onPressed: () {}),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Buttons(buttonText: '7', onPressed: () {}),
                          Buttons(buttonText: '8', onPressed: () {}),
                          Buttons(buttonText: '9', onPressed: () {}),
                          Buttons(buttonText: 'X', onPressed: () {}),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Buttons(buttonText: '7', onPressed: () {}),
                          Buttons(buttonText: '8', onPressed: () {}),
                          Buttons(buttonText: '9', onPressed: () {}),
                          Buttons(buttonText: 'X', onPressed: () {}),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Buttons(buttonText: '7', onPressed: () {}),
                          Buttons(buttonText: '8', onPressed: () {}),
                          Buttons(buttonText: '9', onPressed: () {}),
                          Buttons(buttonText: 'X', onPressed: () {}),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Buttons(buttonText: '7', onPressed: () {}),
                          Buttons(buttonText: '8', onPressed: () {}),
                          Buttons(buttonText: '9', onPressed: () {}),
                          Buttons(buttonText: 'X', onPressed: () {}),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const Buttons({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 55,
        width: 55,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black38,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
          child: Text(buttonText, style: const TextStyle(fontSize: 20.0)),
        ),
      ),
    );
  }
}
