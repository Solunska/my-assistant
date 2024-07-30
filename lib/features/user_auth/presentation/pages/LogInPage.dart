import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_assistant/features/user_auth/presentation/firebase_auth_impl/firebase_auth_services.dart';
import 'package:my_assistant/features/user_auth/presentation/pages/RegisterPage.dart';
import 'package:my_assistant/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:my_assistant/screens/start.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

    final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Најава'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Најавете се!',
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              FormContainerWidget(
                controller: _emailController,
                hintText: 'Внесете ја вашата e-mail адреса',
                isPasswordField: false,
              ),
              const SizedBox(height: 10),
              FormContainerWidget(
                controller: _passwordController,
                hintText: 'Внесете ја вашата лозинка',
                isPasswordField: true,
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap:_login,
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Најава',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Add space between the button and the text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Уште немаш профил?",style: TextStyle(color:Colors.white),),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const RegisterPage()),
                        (route) => false,
                      );
                    },
                    child: const Text(
                      "Регистрирај се тука!",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
    void _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.logInUserWithEmailAndPass(email, password);
    if (user != null) {
      print("User is successfully logged in");
      Navigator.pushNamed(context, "/start");
    } else {
      print("Error occurred while logging in user");
    }
    //TODO: Implement the logic for logging out a user
  }
}
