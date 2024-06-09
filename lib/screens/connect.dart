import 'package:flutter/material.dart';

class Connect extends StatefulWidget {
  final String label;
  const Connect({super.key, required this.label});

  @override
  ConnectState createState() => ConnectState();
}

class ConnectState extends State<Connect> {
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
          title:Text(
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
    );
  }
}
