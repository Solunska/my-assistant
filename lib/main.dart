import 'package:flutter/material.dart';
import 'package:my_assistant/screens/start.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
