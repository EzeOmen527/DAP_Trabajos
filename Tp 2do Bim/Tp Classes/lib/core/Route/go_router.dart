import 'package:go_router/go_router.dart';
import '../../screens/details.dart';
import '../../screens/home_screen.dart';
import '../../screens/login_screen.dart';

//
final appRouter = GoRouter(routes: [
  GoRoute(
    name: LoginScreen.name,
    path: '/',
    builder: (context, state) => LoginScreen(),
  ),
  GoRoute(
    name: Teamsscreen.name,
    path: '/home',
    builder: (context, state) => Teamsscreen(),
  ),
   GoRoute(
      name: TeamsDetailScreen.name,
      path: '/details/:teamsId',
      builder: (context, state) {
      
        final teamsId = state.pathParameters['teamsId'];
        return TeamsDetailScreen(
         teamsId: teamsId!,
        );
      },
    ),
  ],
);

