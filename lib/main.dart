import 'package:flutter/material.dart';
import 'package:my_assistant/features/app/splash_screen/splash_screen.dart';
import 'package:my_assistant/features/user_auth/presentation/pages/LogInPage.dart';
import 'package:my_assistant/features/user_auth/presentation/pages/RegisterPage.dart';
import 'package:my_assistant/screens/start.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF084B83),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(child: RegisterPage()),
        '/login': (context) => const SplashScreen(child: LogInPage()),
        '/start': (context) => const StartScreen(), 
      },
    );
  }
}
