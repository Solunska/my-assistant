import 'package:flutter/material.dart';
import 'package:my_assistant/learning_methods.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'ЗДРАВО ДРУГАРЧЕ!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 45,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 50),
          Image.asset(
            'assets/home-screen-image.png',
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LearningMethods(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
              backgroundColor: const Color(0xFFFF66B3),
            ),
            child: const Text(
              'АЈДЕ ДА УЧИМЕ ЗАЕДНО',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
