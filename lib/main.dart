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
        //iconTheme: const IconThemeData().copyWith(color: Colors.black87),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.black,
        brightness: Brightness.dark,
      ),
      //themeMode: ThemeMode.light,
      themeMode: ThemeMode.dark,
      home: const Calculator(),
    );
  }
}
