import 'package:flutter/material.dart';
import 'package:testerapps/ui/screens/detail_event.dart';
import 'package:testerapps/ui/screens/event.dart';

class EvenRoute {
  static const String evenRoute = '/event'; 
  static const String eventDetailRoute = '/event/detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final uri = Uri.parse(settings.name ?? '');
    
    switch (uri.path) {
      case evenRoute:
        return MaterialPageRoute(
          builder: (_) => EventScreen(),
        );
        

      case eventDetailRoute:
      return MaterialPageRoute(builder: (_) => EventDetailScreen(),
      );


      // case eventDetailRoute:
      //   final eventId = uri.queryParameters['id']; 
      //   if (eventId != null) {
      //     return MaterialPageRoute(
      //       builder: (_) => EventDetailScreen(eventId: eventId), // Pake parameter eventId
      //     );
        // } else {
        //   return _errorRoute("Missing event ID");
        // }

      default:
        return _errorRoute("Route not found: ${settings.name}");
    }
  }

  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: Center(child: Text(message)),
      ),
    );
  }
}
