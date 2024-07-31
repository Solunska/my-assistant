import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const Button({
    super.key, 
    required this.label,
    required this.onPressed,
    });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
          backgroundColor:  const Color.fromARGB(255, 255, 255, 255)),
      child: Text(
        label,
        style: const TextStyle(
            fontSize: 28, color: Color(0xFF084B83), fontWeight: FontWeight.bold),
      ),
    );
  }
}
