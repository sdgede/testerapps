import 'package:flutter/material.dart';
import 'package:testerapps/ui/screens/profile_screen.dart';

class ProfileRoute {
  static const String prifileRoute = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case prifileRoute:
        return MaterialPageRoute(
          builder: (_) => const AkunScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Center(child: Text('Profile')),
        );
    }
  }

  // Add any additional properties or methods if needed
}