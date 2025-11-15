import 'package:flutter/material.dart';
import 'package:testerapps/constants/apps_router.dart';
import 'package:testerapps/ui/routes/even_route.dart';
import 'package:testerapps/ui/routes/home_page_route.dart';
import 'package:testerapps/ui/routes/auth_route.dart';
import 'package:testerapps/ui/routes/payment_route.dart';
import 'package:testerapps/ui/routes/profile_route.dart';
import 'package:testerapps/ui/routes/raport_route.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {


    if (settings.name == '/') {
      return LoginRouter.generateRoute(settings);
    }else if (settings.name?.startsWith(AppsRouter.auth) ?? false) {
      return LoginRouter.generateRoute(settings);
    } else if (settings.name?.startsWith(AppsRouter.home) ?? false) {
      return HomePageRoute.generateRoute(settings);
    } else if (settings.name?.startsWith(AppsRouter.payment) ?? false) {
      return PaymentRoute.generateRoute(settings);
    } else if (settings.name?.startsWith(AppsRouter.raport) ?? false) {
      return RaportRoute.generateRoute(settings);
    } else if (settings.name?.startsWith(AppsRouter.event) ?? false) {
      return EvenRoute.generateRoute(settings);
    } else if (settings.name?.startsWith(AppsRouter.detailEvent) ?? false) {
      return ProfileRoute.generateRoute(settings);
    }else if (settings.name?.startsWith(AppsRouter.profile) ?? false) {
      return ProfileRoute.generateRoute(settings);
      }

    throw Exception('Route not found: ${settings.name}');
  }
}
