import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatefulWidget {
  ProgressScreen({super.key});
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  User? _currentUser;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    setState(() {
      _currentUser = widget._auth.currentUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Тука можете да го следите напредокот на вашето дете',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            _currentUser != null
                ? Column(
                    children: [
                      Text(
                        'Current User: ${_currentUser!.email}',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Text(
                        'Username: ${_currentUser!.displayName}',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
                  )
                : Text(
                    'No user is currently logged in.',
                    style: TextStyle(fontSize: 18.0),
                  ),
          ],
        ),
      ),
    );
  }
}
