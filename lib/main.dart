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
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: Colors.black,
        iconTheme: const IconThemeData().copyWith(color: Colors.white),
        brightness: Brightness.dark,
        /*colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xFF1DB954))
            .copyWith(background: Colors.black),*/
      ),
      //themeMode: ThemeMode.light,
      themeMode: ThemeMode.dark,
      home: const Calculator(),
    );
  }
}
