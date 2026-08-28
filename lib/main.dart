import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const TravelCompanionApp());
}

class TravelCompanionApp extends StatelessWidget {
  const TravelCompanionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel Companion',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF087E8B),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}