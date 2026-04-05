import 'package:flutter/material.dart';
import 'package:higher_or_lower/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Higher or Lower',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: Color(0xff35157b),
          secondary: Color(0xff3c02b8),
        ),
      ),
      home: const HomePage(),
    );
  }
}