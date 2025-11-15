import 'package:flutter/material.dart';
import 'package:testerapps/ui/screens/raport_screen.dart';

class RaportRoute {
  static const String raport = '/raport';
 static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case raport:
        return MaterialPageRoute(
          builder: (_) => const RaportScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const RaportScreen(),
        );
    }
  }
}