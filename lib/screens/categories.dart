import 'package:flutter/material.dart';
import 'package:my_assistant/UI/category_button.dart';
import 'package:my_assistant/screens/connect.dart';
import 'package:my_assistant/screens/learning.dart';

class CategoriesScreen extends StatelessWidget {
  final String appBarLabel;
  final double appBarFontSize;
  final String gameMode;

  const CategoriesScreen(
      {super.key,
      required this.appBarLabel,
      required this.appBarFontSize,
      required this.gameMode});

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
            style: TextStyle(
              fontSize: appBarFontSize,
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
                      if (gameMode == 'connect') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Connect(label: 'ПОВРЗИ ГИ\nБРОЕВИТЕ',),
                          ),
                        );
                      } else if (gameMode == 'questions') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Connect(label: 'ПОГОДИ ГИ\nБРОЕВИТЕ',),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const Learning(category: 'numbers'),
                          ),
                        );
                      }
                    },
                  ),
                  CustomButton(
                    image: 'assets/shapes.png',
                    label: 'ФОРМИ',
                    onPressed: () {
                      if (gameMode == 'connect') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Connect(label: 'ПОВРЗИ ГИ\nФОРМИТЕ',),
                          ),
                        );
                      } else if (gameMode == 'questions') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Connect(label: 'ПОГОДИ ГИ\nФОРМИТЕ',),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const Learning(category: 'shapes'),
                          ),
                        );
                      }
                    },
                  ),
                  CustomButton(
                    image: 'assets/food.png',
                    label: 'ХРАНА',
                    onPressed: () {
                      if (gameMode == 'connect') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Connect(label: 'ПОВРЗИ ЈА\nХРАНАТА',),
                          ),
                        );
                      } else if (gameMode == 'questions') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Connect(label: 'ПОГОДИ ЈА\nХРАНАТА',),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const Learning(category: 'foods'),
                          ),
                        );
                      }
                    },
                  ),
                  CustomButton(
                    image: 'assets/greetings-images/greetings.png',
                    label: 'ПОЗДРАВИ',
                    onPressed: () {
                      if (gameMode == 'connect') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Connect(label: 'ПОВРЗИ ГИ\nПОЗДРАВИТЕ',),
                          ),
                        );
                      } else if (gameMode == 'questions') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Connect(label: 'ПОГОДИ ГИ\nПОЗДРАВИТЕ',),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const Learning(category: 'greetings'),
                          ),
                        );
                      }
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
