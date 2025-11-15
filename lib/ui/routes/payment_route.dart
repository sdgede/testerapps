// manajemen route
import 'package:flutter/material.dart';
import 'package:testerapps/ui/screens/payment_screen.dart';

class PaymentRoute {
  static const String paymentRoute = '/payment';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case paymentRoute:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      default:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
    }
  }
}