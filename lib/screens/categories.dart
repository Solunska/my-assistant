import 'package:flutter/material.dart';
import 'package:my_assistant/UI/category_button.dart';
import 'package:my_assistant/learning_numbers.dart';
import 'package:my_assistant/screens/learning_greetings.dart';

class CategoriesScreen extends StatelessWidget {
  final String appBarLabel;

  const CategoriesScreen({super.key, required this.appBarLabel});

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
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            appBarLabel,
            style: const TextStyle(
              fontSize: 43,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color(0xFF42BFDD),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          titleTextStyle: const TextStyle(
            color: Colors.white,
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
            Container(
              height: 500,
              padding: const EdgeInsets.all(10),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 60,
                crossAxisSpacing: 10,
                children: [
                  CustomButton(
                    image: 'assets/numbers.png',
                    label: 'БРОЈКИ',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LearningNumbers(),
                        ),
                      );
                    },
                  ),
                  CustomButton(
                    image: 'assets/shapes.png',
                    label: 'ФОРМИ',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LearningNumbers(),
                        ),
                      );
                    },
                  ),
                  CustomButton(
                    image: 'assets/food.png',
                    label: 'ХРАНА',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LearningNumbers(),
                        ),
                      );
                    },
                  ),
                  CustomButton(
                    image: 'assets/greetings.png',
                    label: 'ПОЗДРАВИ',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GreetingsScreen(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
