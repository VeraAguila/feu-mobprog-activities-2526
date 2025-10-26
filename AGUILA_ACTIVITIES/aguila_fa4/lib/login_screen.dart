import 'package:aguila_fa4/book_rating/rating_screen.dart';
import 'package:aguila_fa4/main.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void loginButton() {
    if (usernameController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Invalid Data'),
          content: Text('Complete all details'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );

      return;
    } else if (usernameController.text.trim() != 'Admin' ||
        passwordController.text.trim() != 'admin123') {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Invalid Data'),
          content: Text('Invalid username or password'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );

      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const RatingScreen()),
    );
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            SizedBox(height: 180),
            Text(
              "WELCOME",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 50),
            TextField(
              controller: usernameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text("Username"),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.0),
                ),
              ),
            ),
            SizedBox(height: 50),
            TextField(
              controller: passwordController,
              keyboardType: TextInputType.text,
              
              decoration: InputDecoration(
                label: Text("Password"),
                fillColor: xDarkColorScheme.onSecondaryContainer,
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.0),
                ),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(onPressed: loginButton, child: Text("Log in")),
          ],
        ),
      ),
    );
  }
}
