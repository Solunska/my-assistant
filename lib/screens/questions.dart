import 'package:flutter/material.dart';
import 'package:my_assistant/classes/number.dart';
import 'package:my_assistant/classes/food.dart';
import 'package:my_assistant/classes/greetings.dart';
import 'package:my_assistant/classes/shape.dart';

class Questions extends StatefulWidget {
  final String label;
  final String category;
  const Questions({super.key, required this.label, required this.category});

  @override
  QuestionsState createState() => QuestionsState();
}

class QuestionsState extends State<Questions> {
  List<dynamic> items = [];
  List<String> answers = [];
  List<String> disabledAnswers = [];
  dynamic currentItem;
  String message = '';

  @override
  void initState() {
    super.initState();

    if (widget.category == 'numbers') {
      items = List<dynamic>.from(numbers);
    } else if (widget.category == 'shapes') {
      items = List<dynamic>.from(shapes);
    } else if (widget.category == 'greetings') {
      items = List<dynamic>.from(greetings);
    } else if (widget.category == 'foods') {
      items = List<dynamic>.from(foods);
    }

    setupQuestion();
  }

  void setupQuestion() {
    items.shuffle();
    answers =
        items.take(3).map<String>((item) => item.title as String).toList();
    answers.shuffle();
    disabledAnswers.clear();
    currentItem = items.first;
  }

  void checkAnswer(String answer) {
    setState(() {
      if (answer == currentItem.title) {
        message = 'ТОЧНО!';
        setupQuestion();
      } else {
        message = 'ГРЕШНО, ОБИДИ СЕ ПОВТОРНО!';
        disabledAnswers.add(answer); // Add incorrect answer to disabled list
      }
    });
  }

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
            widget.label,
            style: const TextStyle(
              fontSize: 28,
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
          children: [
            for (var answer in answers)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: SizedBox(
                  width: 250,
                  height: 65,
                  child: ElevatedButton(
                    onPressed: disabledAnswers.contains(answer)
                        ? null
                        : () => checkAnswer(answer),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Text color
                      ),
                      backgroundColor: disabledAnswers.contains(answer)
                          ? Colors.red
                          : Colors.white,
                      // Background color
                    ),
                    child: Text(
                      answer,
                      style: const TextStyle(
                        color: Colors.black, // Text color
                      ),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 60),
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(currentItem.image),
            ),
            Text(
              message,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: message == 'ТОЧНО!' ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
