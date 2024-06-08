import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart'; // Commented out since audio is not needed
import 'package:my_assistant/classes/number.dart';

class LearningNumbers extends StatefulWidget {
  const LearningNumbers({super.key});

  @override
  LearningNumbersState createState() => LearningNumbersState();
}

class LearningNumbersState extends State<LearningNumbers> {
  int currentIndex = 0;
  // late AudioPlayer audioPlayer; // Commented out since audio is not needed

  List<Number> numbers = [
    Number(title: 'ЕДЕН', image: 'assets/numbers/one.png', audio: 'assets/audio/hello.mp3'),
    Number(title: 'ДВА', image: 'assets/numbers/two.png', audio: 'assets/audio/hello.mp3'),
    Number(title: 'ТРИ', image: 'assets/numbers/three.png', audio: 'assets/audio/hello.mp3'),
    Number(title: 'ЧЕТИРИ', image: 'assets/numbers/four.png', audio: 'assets/audio/hello.mp3'),
    Number(title: 'ПЕТ', image: 'assets/numbers/five.png', audio: 'assets/audio/hello.mp3'),
    Number(title: 'ШЕСТ', image: 'assets/numbers/six.png', audio: 'assets/audio/hello.mp3'),
    Number(title: 'СЕДУМ', image: 'assets/numbers/seven.png', audio: 'assets/audio/hello.mp3'),
    Number(title: 'ОСУМ', image: 'assets/numbers/eight.png', audio: 'assets/audio/hello.mp3'),
    Number(title: 'ДЕВЕТ', image: 'assets/numbers/nine.png', audio: 'assets/audio/hello.mp3'),

  ];

  @override
  void initState() {
    super.initState();
    // audioPlayer = AudioPlayer(); // Commented out since audio is not needed
  }

  @override
  void dispose() {
    // audioPlayer.dispose(); // Commented out since audio is not needed
    super.dispose();
  }

  void nextNumber() {
    setState(() {
      if (currentIndex < numbers.length - 1) {
        currentIndex++;
      }
    });
  }

  void previousNumber() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      }
    });
  }

  // void playAudio() async {
  //   await audioPlayer.play(numbers[currentIndex].audio, isLocal: true);
  // }

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
          title: const Text(
            'БРОЕВИИ',
            style: TextStyle(
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            numbers[currentIndex].image,
            width: 800,
            height: 400,
          ),
          Text(
            numbers[currentIndex].title,
            style: const TextStyle(
              fontSize: 45, 
              fontWeight: FontWeight.bold, 
              color: Colors.black
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(7),
                  backgroundColor: Colors.white,
                ),
                onPressed: previousNumber,
                child: const Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 35,
                  color: Color(0xFF084B83),
                ),
              ),
              const SizedBox(width: 50),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     padding: const EdgeInsets.all(7),
              //     backgroundColor: const Color(0xFFFF66B3),
              //   ),
              //   onPressed: playAudio,
              //   child: const Icon(
              //     Icons.volume_up,
              //     size: 35,
              //     color: Colors.white,
              //   ),
              // ),
              const SizedBox(width: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(7),
                  backgroundColor: Colors.white,
                ),
                onPressed: nextNumber,
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 35,
                  color: Color(0xFF084B83),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
