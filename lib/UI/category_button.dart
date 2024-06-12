import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String image;
  final String label;
  final VoidCallback onPressed; // Optional callback for button press

  const CustomButton({
    super.key,
    required this.image,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 170, // Fixed width
              height: 120, // Fixed height
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: IconButton(
                  icon: Image.asset(image),
                  iconSize: 200,
                  onPressed: onPressed,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 170, // Fixed width
              height: 60, // Fixed height
              child: ElevatedButton(
                onPressed: onPressed,
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                  backgroundColor: const Color(0xFFFF66B3),
                ),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}