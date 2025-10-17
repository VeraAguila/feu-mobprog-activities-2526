import 'package:aguila_fa3/pos/pos_screen.dart';
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
  var message = '';

  void loginButton() {
    message = '';
    if (usernameController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty    
    ) {
      message = 'Please fill out all fields';
    }else if (usernameController.text.trim() != 'Admin' ||
              passwordController.text.trim() != 'admin1234'
    ) {
      message = 'Invalid username or password';
    }
    
    if (message != ''){
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Invalid Data',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          content: Text(
            message,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text(
                'OK',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      );

      return;
    }
    
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const PosScreen()),
    );
    return;
  }

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            children: [
              SizedBox(height: 150),
              Text(
                "Welcome back",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 60),
              TextField(
                controller: usernameController,
                maxLength: 50,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text('Username'),
                  prefixIcon: const Icon(Icons.person_2_sharp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 30),
              TextField(
                controller: passwordController,
                maxLength: 50,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text('Password'),
                  prefixIcon: const Icon(Icons.password_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: loginButton,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ).merge(Theme.of(context).elevatedButtonTheme.style), 
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
