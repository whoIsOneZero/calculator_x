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
      //backgroundColor: Colors.black,
      body: Row(
        children: [
          ElevatedButton(
            onPressed: () {},
            //style: ButtonStyle(backgroundColor: Colors.grey),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.sunny),
                Icon(Icons.nightlight),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
