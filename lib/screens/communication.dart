import 'package:flutter/material.dart';
import 'package:my_assistant/UI/button.dart';
import 'package:my_assistant/UI/category_button.dart';
import 'package:my_assistant/screens/connect.dart';
import 'package:my_assistant/screens/learning.dart';
import 'package:my_assistant/screens/needs.dart';
import 'package:my_assistant/screens/questions.dart';

class CommunicationScreen extends StatelessWidget {
  final String appBarLabel;
  final double appBarFontSize;
  final String gameMode;

  const CommunicationScreen(
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 350,
                height: 100,
                child: Button(
                  label: 'МИ ТРЕБА...',
                  onPressed: () {
                    Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NeedsScreen(),
                  ),
                );
                  },
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: 350,
                height: 100,
                child: Button(
                  label: 'САКАМ...',
                  onPressed: () {
                    
                  },
                ),
              ),
               const SizedBox(height: 20,),
              SizedBox(
                width: 350,
                height: 100,
                child: Button(
                  label: 'ДАЛИ ИМА...?',
                  onPressed: () {
                    
                  },
                ),
              ),
               const SizedBox(height: 20,),
              SizedBox(
                width: 350,
                height: 100,
                child: Button(
                  label: 'ЌЕ...',
                  onPressed: () {
                    
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
