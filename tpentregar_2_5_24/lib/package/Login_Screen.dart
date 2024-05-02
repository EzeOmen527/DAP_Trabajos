import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(LoginScreen());
}

class LoginScreen extends StatelessWidget {
  static const String name = 'login';
  LoginScreen({super.key});
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
              onPressed: () {
                if (username.text == 'Rafa&Eze' && password.text == 'brawlstars') {
                  print('Login Success');
                  context.push('/home');
                } else {
                  print('Login Failed');
                }
              },
              child: const Text('Login'),
              ),
             TextField(
              controller: username,
              decoration: const InputDecoration(
                hintText: 'Username',
                icon: Icon(Icons.person_2_outlined),
             ),
            ),

             TextField(
              controller: password,
              decoration: const InputDecoration(
                hintText: 'Password',
                icon: Icon(Icons.lock_clock_outlined),
              ),
              obscureText: true,
            ),
          ],
        ),
      ),
      );
   
  }
}