import 'package:flutter/material.dart';
import 'package:my_assistant/UI/button.dart';
import 'package:my_assistant/screens/categories.dart';
import 'package:my_assistant/screens/play_modes.dart';

class LearningMethodsScreen extends StatelessWidget {
  const LearningMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 45,
              color: Color(0xFF084B83),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            "ОДБЕРИ МЕТОД",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color(0xFF084B83),
            ),
          ),
          backgroundColor: const Color(0xFFF0F6F6),
          iconTheme: const IconThemeData(
            color: Color(0xFF084B83),
          ),
          titleTextStyle: const TextStyle(
            color: Color(0xFF084B83),
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
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
            const SizedBox(height: 30),
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
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
