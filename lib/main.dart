import 'package:flutter/material.dart';
import '../widgets/calculator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CalculatorX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      //themeMode: ThemeMode.light,
      themeMode: ThemeMode.dark,
      home: Calculator(),
    );
  }
}
