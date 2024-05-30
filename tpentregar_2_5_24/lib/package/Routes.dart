import 'Home_Screen.dart';
import 'Login_Screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) => HomeScreen(userName: state.extra as String),
  ),
]);