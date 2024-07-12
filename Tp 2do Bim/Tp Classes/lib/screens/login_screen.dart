import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/pass.dart';
import '../entities/User.dart';
import 'home_screen.dart';





// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  static const String name = 'login';
  final List<User> teams = userlist;
  LoginScreen({super.key});

  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userController,
              decoration: const InputDecoration(
                hintText: 'Usuario',
                icon: Icon(Icons.person),
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Contraseña',
                icon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                String textoingresadouser = userController.text;
                String textoingresadopass = passwordController.text;

                if (textoingresadouser.isEmpty || textoingresadopass.isEmpty) {
                  //¿Se ha ingresado Usuario y Contraseña?
                  const logInVacio = SnackBar(
                    duration: Duration(seconds: 3),
                    content: Text('Campos Vacíos'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(logInVacio);
                  return;
                }

                User? usuario = userlist.firstWhere(
                  (user) => user.name == textoingresadouser,
                  orElse: () => User(id: '', name: '', pass: ''),
                );

                if (usuario.name.isEmpty) {
                  const userNoExiste = SnackBar(
                    duration: Duration(seconds: 3),
                    content: Text('Usuario no existe.'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(userNoExiste);
                } else if (usuario.pass != textoingresadopass) {
                  const logInFallido = SnackBar(
                    duration: Duration(seconds: 3),
                    content: Text('Contraseña incorrecta.'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(logInFallido);
                } else {
                  context.pushNamed(Teamsscreen.name, extra: usuario.name);
                  const logInExitoso = SnackBar(
                    duration: Duration(seconds: 3),
                    content: Text('Inicio de sesión exitoso.'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(logInExitoso);
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
