import 'package:flutter/material.dart';
import 'package:my_assistant/classes/number.dart';
import 'package:my_assistant/classes/food.dart';
import 'package:my_assistant/classes/greetings.dart';
import 'package:my_assistant/classes/shape.dart';

class Connect extends StatefulWidget {
  final String label;
  final String category;
  const Connect({super.key, required this.label, required this.category});

  @override
  ConnectState createState() => ConnectState();
}

class ConnectState extends State<Connect> {
  List<dynamic> shuffledImages = [];
  List<dynamic> shuffledTitles = [];
  List<int> selectedImagesIndex = [];
  List<int> selectedTitlesIndex = [];
  bool isConnecting = false;

  @override
  void initState() {
    super.initState();

    List<dynamic> items = [];
    if (widget.category == 'numbers') {
      items = List<dynamic>.from(numbers);
    } else if (widget.category == 'shapes') {
      items = List<dynamic>.from(shapes);
    } else if (widget.category == 'greetings') {
      items = List<dynamic>.from(greetings);
    } else if (widget.category == 'foods') {
      items = List<dynamic>.from(foods);
    }

    shuffledImages = List.from(items)..shuffle();
    shuffledTitles = List.from(items)..shuffle();
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
              fontSize: 30,
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
      body: Row(
        children: [
          // Left side with images
          Expanded(
            child: ListView.builder(
              itemCount: shuffledImages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selectedImagesIndex.contains(index)) {
                        selectedImagesIndex.remove(index);
                      } else {
                        if (selectedImagesIndex.length < 2) {
                          selectedImagesIndex.add(index);
                        }
                      }
                      checkConnections();
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    color: selectedImagesIndex.contains(index)
                        ? Colors.blue.withOpacity(0.5)
                        : Colors.transparent,
                    child: ListTile(
                      leading: SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset(getImage(shuffledImages[index])),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Right side with titles
          Expanded(
            child: ListView.builder(
              itemCount: shuffledTitles.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selectedTitlesIndex.contains(index)) {
                        selectedTitlesIndex.remove(index);
                      } else {
                        if (selectedTitlesIndex.length < 2) {
                          selectedTitlesIndex.add(index);
                        }
                      }
                      checkConnections();
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    color: selectedTitlesIndex.contains(index)
                        ? Colors.blue.withOpacity(0.5)
                        : Colors.transparent,
                    child: ListTile(
                      title: SizedBox(
                        height: 40,
                        child: Center(
                          child: Text(
                            getTitle(shuffledTitles[index]),
                            style: const TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void checkConnections() {
    if (selectedImagesIndex.length == 1 && selectedTitlesIndex.length == 1) {
      // Check if the selected items are a correct pair
      bool isCorrectPair = checkCorrectPair(
        shuffledImages[selectedImagesIndex[0]],
        shuffledTitles[selectedTitlesIndex[0]],
      );
      if (isCorrectPair) {
        // Handle the correct pair (e.g., show a success message, remove items, etc.)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Correct pair!')),
        );
        setState(() {
          shuffledImages.removeAt(selectedImagesIndex[0]);
          shuffledTitles.removeAt(selectedTitlesIndex[0]);
          selectedImagesIndex.clear();
          selectedTitlesIndex.clear();
        });
      } else {
        // Handle the incorrect pair (e.g., show an error message)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Incorrect pair!')),
        );
        setState(() {
          selectedImagesIndex.clear();
          selectedTitlesIndex.clear();
        });
      }
    }
  }

  bool checkCorrectPair(dynamic item1, dynamic item2) {
    return item1.runtimeType == item2.runtimeType && item1.title == item2.title;
  }

  String getImage(dynamic item) {
    if (item is Number) {
      return item.image;
    } else if (item is Shape) {
      return item.image;
    } else if (item is Greeting) {
      return item.image;
    } else if (item is Food) {
      return item.image;
    }
    return '';
  }

  String getTitle(dynamic item) {
    if (item is Number) {
      return item.title;
    } else if (item is Shape) {
      return item.title;
    } else if (item is Greeting) {
      return item.title;
    } else if (item is Food) {
      return item.title;
    }
    return '';
  }
}
