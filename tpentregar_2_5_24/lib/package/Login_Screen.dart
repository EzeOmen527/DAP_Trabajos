
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passController = TextEditingController();
    TextEditingController userController = TextEditingController();
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userController,
              decoration: const InputDecoration(
                hintText: 'Username',
                icon: Icon(Icons.person_2_outlined),
              ),
            ),
            TextField(
              controller: passController,
              decoration: const InputDecoration(
                hintText: 'Password',
                icon: Icon(Icons.lock_clock_outlined),
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                String userInput = userController.text;
                String passInput = passController.text;

                List<String> users = ['Rafa', 'Eze', 'SachoLindo', 'GabyGay'];
                List<String> passwords = ['Rafafa', 'Ezzze', 'Sachincli', 'Mechanic_gaby'];

                if (userInput.isEmpty || passInput.isEmpty) {
                  SnackBar snackBarVacio =
                      const SnackBar(content: Text('Login correcto'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBarVacio);
                  return;
                }
                if ((users.contains(userInput))) {
                  if (passwords.contains(passInput) &&
                      passInput == passwords[passwords.indexOf(userInput)]) {
                    SnackBar snackBar =
                        const SnackBar(content: Text('Login correcto'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    context.push('/homeScreen', extra: userInput);
                  }
                } else {
                  SnackBar snackBarIncorrecto =
                      const SnackBar(content: Text('Login correcto'));
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackBarIncorrecto);
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}