import 'package:flutter/material.dart';
import 'package:my_assistant/UI/button.dart';
import 'package:my_assistant/screens/categories.dart';
import 'package:my_assistant/screens/play_modes.dart';

class LearningMethodsScreen extends StatelessWidget {
  const LearningMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Image.asset('assets/learning.png',
                width: 250, height: 250, fit: BoxFit.contain),
            const SizedBox(height: 20),
            Button(
              label: 'УЧИМЕ',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CategoriesScreen(
                      appBarLabel: 'УЧИМЕ',
                      appBarFontSize: 43,
                      gameMode: 'none',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 50),
            Image.asset('assets/playing.png',
                width: 250, height: 250, fit: BoxFit.contain),
            const SizedBox(height: 0),
            Button(
              label: 'ИГРАМЕ',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlayingModesScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
