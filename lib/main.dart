import 'package:flutter/material.dart';
import 'package:my_assistant/screens/start.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF084B83),
      ),
      home: const Scaffold(
        body: StartScreen(), 
      ),
    ),
  );
}
