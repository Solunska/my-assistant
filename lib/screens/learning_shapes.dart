import 'package:flutter/material.dart';
import 'package:my_assistant/classes/shape.dart';

class LearningShapes extends StatefulWidget {
  const LearningShapes({super.key});

  @override
  LearningShapesState createState() => LearningShapesState();
}

class LearningShapesState extends State<LearningShapes>
{
  int currentIndex=0;
  List<Shape> shapes=[
    Shape(title:'КРУГ', image: 'assets/shapes/circle.png', audio: 'assets/audio/hello.mp3'),
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

  void nextShape() {
    setState(() {
      if (currentIndex < shapes.length - 1) {
        currentIndex++;
      }
    });
  }

  void previousShape() {
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
            'ФОРМИ',
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
            shapes[currentIndex].image,
            width: 800,
            height: 400,
          ),
          Text(
            shapes[currentIndex].title,
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
                onPressed: previousShape,
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
                onPressed: nextShape,
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