import 'package:flutter/material.dart';
import '../../features/authentication/presentation/screens/login_screen.dart';
import '../../features/navigation/presentation/screens/main_navigation_screen.dart';

class AppRouter {
  static const String initialRoute = '/';
  static const String login = '/login';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => const MainNavigationScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
