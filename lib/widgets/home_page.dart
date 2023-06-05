import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
                padding: const EdgeInsets.only(top: 25.0),
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
                            icon: const Icon(Icons.wb_sunny_outlined)),
                        const SizedBox(
                          width: 2.0,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.nightlight_outlined)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 300.0,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(24.0),
                  topLeft: Radius.circular(24.0),
                ),
                color: Colors.blueGrey[900],
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Buttons(
                            buttonText: 'C',
                            myColor: Colors.green,
                            onPressed: () {}),
                        Buttons(
                            buttonText: '+/-',
                            myColor: Colors.green,
                            onPressed: () {}),
                        Buttons(
                            buttonText: '%',
                            myColor: Colors.green,
                            onPressed: () {}),
                        Buttons(
                            buttonText: '÷',
                            myColor: Colors.red,
                            onPressed: () {}),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Buttons(buttonText: '7', onPressed: () {}),
                        Buttons(buttonText: '8', onPressed: () {}),
                        Buttons(buttonText: '9', onPressed: () {}),
                        Buttons(
                            buttonText: 'x',
                            myColor: Colors.red,
                            onPressed: () {}),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Buttons(buttonText: '4', onPressed: () {}),
                        Buttons(buttonText: '5', onPressed: () {}),
                        Buttons(buttonText: '6', onPressed: () {}),
                        Buttons(
                            buttonText: '–',
                            myColor: Colors.red,
                            onPressed: () {}),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Buttons(buttonText: '1', onPressed: () {}),
                        Buttons(buttonText: '2', onPressed: () {}),
                        Buttons(buttonText: '3', onPressed: () {}),
                        Buttons(
                            buttonText: '+',
                            myColor: Colors.red,
                            onPressed: () {}),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Buttons(
                            myIcon: const Icon(Icons.undo, color: Colors.red),
                            onPressed: () {}),
                        Buttons(buttonText: '0', onPressed: () {}),
                        Buttons(
                            buttonText: '●',
                            myColor: Colors.red,
                            onPressed: () {}),
                        Buttons(
                            buttonText: '=',
                            myColor: Colors.red,
                            onPressed: () {}),
                      ],
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
  final VoidCallback onPressed;
  final String? buttonText;
  final Icon? myIcon;
  final Color? myColor;

  const Buttons({
    Key? key,
    required this.onPressed,
    this.buttonText,
    this.myIcon,
    this.myColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: 65,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black38,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
        ),
        child: myIcon ??
            Text(
              buttonText!,
              style: TextStyle(fontSize: 26.0, color: myColor ?? Colors.white),
            ),
      ),
    );
  }
}
