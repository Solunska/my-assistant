import 'package:flutter/material.dart';
import 'package:my_assistant/categories.dart';

class LearningMethods extends StatelessWidget {
  const LearningMethods({super.key});

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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CategoriesScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                  backgroundColor: const Color(0xFFFF66B3)),
              child: const Text(
                'УЧИМЕ',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 50),
            Image.asset('assets/playing.png',
                width: 250, height: 250, fit: BoxFit.contain),
            const SizedBox(height: 0),
            ElevatedButton(
              onPressed: () {
                // functionality for button press here
              },
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                  backgroundColor: const Color(0xFFFF66B3)),
              child: const Text(
                'ИГРАМЕ',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
