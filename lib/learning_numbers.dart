import 'package:flutter/material.dart';

class LearningNumbers extends StatelessWidget {
  const LearningNumbers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning Numbers'),
      ),
      body: const Center(
        child: Text('Welcome to Learning Numbers!'),
      ),
    );
  }
}
