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
                      backgroundColor: Colors.blueGrey[900],
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.wb_sunny_outlined),
                        SizedBox(
                          width: 20.0,
                        ),
                        Icon(Icons.nightlight_outlined),
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
                        Buttons(buttonText: 'AC', onPressed: () {}),
                        Buttons(buttonText: '+/-', onPressed: () {}),
                        Buttons(buttonText: '*/*', onPressed: () {}),
                        Buttons(buttonText: '/', onPressed: () {}),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Buttons(buttonText: '7', onPressed: () {}),
                        Buttons(buttonText: '8', onPressed: () {}),
                        Buttons(buttonText: '9', onPressed: () {}),
                        Buttons(buttonText: 'X', onPressed: () {}),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Buttons(buttonText: '4', onPressed: () {}),
                        Buttons(buttonText: '5', onPressed: () {}),
                        Buttons(buttonText: '6', onPressed: () {}),
                        Buttons(buttonText: '-', onPressed: () {}),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Buttons(buttonText: '1', onPressed: () {}),
                        Buttons(buttonText: '2', onPressed: () {}),
                        Buttons(buttonText: '3', onPressed: () {}),
                        Buttons(buttonText: '+', onPressed: () {}),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Buttons(
                          buttonText: 'B',
                          onPressed: () {},
                        ),
                        Buttons(buttonText: '0', onPressed: () {}),
                        Buttons(buttonText: '.', onPressed: () {}),
                        Buttons(buttonText: '=', onPressed: () {}),
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
  final String buttonText;
  final VoidCallback onPressed;

  const Buttons({
    Key? key,
    required this.buttonText,
    required this.onPressed,
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
        child: Text(buttonText, style: const TextStyle(fontSize: 20.0)),
      ),
    );
  }
}
