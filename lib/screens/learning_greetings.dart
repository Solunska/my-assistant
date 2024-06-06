import 'package:flutter/material.dart';
import 'package:my_assistant/classes/greetings.dart';
import 'package:audioplayers/audioplayers.dart';

class GreetingsScreen extends StatefulWidget {
  const GreetingsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GreetingsScreenState createState() => _GreetingsScreenState();
}

class _GreetingsScreenState extends State<GreetingsScreen> {
  int currentIndex = 0; // Index of the currently displayed greeting
  late AudioPlayer audioPlayer;

  List<Greeting> greetings = [
    Greeting(
      title: 'ДОБРО УТРО',
      image: 'assets/good-morning.png',
      audio: 'assets/audio/hello.mp3',
    ),
    Greeting(
      title: 'ДОБРА НОЌ',
      image: 'assets/good-night.png',
      audio: 'assets/audio/hello.mp3',
    ),
    Greeting(
      title: 'ЗДРАВО',
      image: 'assets/hello.png',
      audio: 'assets/audio/hello.mp3',
    ),
    Greeting(
      title: 'ПРИЈАТНО',
      image: 'assets/goodbye.png',
      audio: 'assets/audio/hello.mp3',
    ),
  ];

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  // void playAudio(String audioPath) async {
  //   int result = await audioPlayer.play(audioPath, isLocal: true);
  //   if (result == 1) {
  //     print('Audio playback started successfully');
  //   } else {
  //     print('Error starting audio playback');
  //   }
  // }

  void nextGreeting() {
    setState(() {
      if (currentIndex < greetings.length - 1) {
        currentIndex++;
      }
    });
  }

  void previousGreeting() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
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
          title: const Text(
            'ПОЗДРАВИ',
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
            greetings[currentIndex].image,
            width: 800,
            height: 400,
          ),
          Text(
            greetings[currentIndex].title,
            style: const TextStyle(
                fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(7),
                    backgroundColor: Colors.white),
                onPressed: previousGreeting,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 35,
                    color: Color(0xFF084B83),
                  ),
                  onPressed: previousGreeting,
                ),
              ),
              const SizedBox(width: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(7),
                  backgroundColor: const Color(0xFFFF66B3),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.volume_up,
                    size: 35,
                    color: Colors.white,
                  ),
                  onPressed: () => {},
                ),
                onPressed: () => {},
              ),
              const SizedBox(width: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(7),
                  backgroundColor: Colors.white,
                ),
                onPressed: nextGreeting,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 35,
                    color: Color(0xFF084B83),
                  ),
                  onPressed: nextGreeting,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
