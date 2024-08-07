import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
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
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();

    _confettiController =
        ConfettiController(duration: const Duration(seconds: 1));

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

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
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
        _confettiController.play();
        Future.delayed(const Duration(seconds: 2), () {
          setupQuestion();
        });
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
          backgroundColor: const Color(0xFFF0F0F6),
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
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var answer in answers)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: SizedBox(
                        width: 250,
                        height: 75,
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
                              fontSize: 25,
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
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: false,
                colors: const [
                  Colors.red,
                  Colors.blue,
                  Colors.green,
                  Colors.yellow,
                  Colors.orange,
                  Colors.purple
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
