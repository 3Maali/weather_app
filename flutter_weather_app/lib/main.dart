import 'package:flutter/material.dart';
import 'package:flutter_weather_app/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: const HomeScreen(),
     // theme: ThemeData.dark(),
      //themeAnimationDuration: ,
    );
  }
}
