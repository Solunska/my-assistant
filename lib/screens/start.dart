import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_assistant/screens/methods.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF084B83), // Assuming the background is blue
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'ЗДРАВО ДРУГАРЧЕ!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 45,
                color:Colors.white,
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
                    builder: (context) => const LearningMethodsScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                backgroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text(
                'АЈДЕ ДА УЧИМЕ ЗАЕДНО',
                style: TextStyle( color: Color(0xFF084B83),fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(height: 20), // Add some space between the buttons
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                backgroundColor: Colors.red,
                textStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
              child: const Text(
                'ЧАО ЧАО!',
                style: TextStyle(color:  Color(0xFFF0F6F6), fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
