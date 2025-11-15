import 'package:flutter/material.dart';
import 'package:testerapps/ui/screens/home_page.dart';

class HomePageRoute {
  static const home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text("Route Error")),
            body: Center(child: Text("Route not found: ${settings.name}")),
          ),
        );
    }
  }
}
