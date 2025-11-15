import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testerapps/data/remote/student_api.dart';
import 'package:testerapps/ui/bloc/auth_block.dart';
import 'package:testerapps/ui/screens/login_screen.dart';

// Route untuk login
class LoginRouter  {
  static const auth = '/auth';
  
  static Route<dynamic> generateRoute(RouteSettings settings) {

    
    switch (settings.name) {
      case auth:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginBloc>(
             create: (context) => LoginBloc(StudentApi()),
            child: const LoginScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text("Error")),
            body: const Center(child: Text("Route not found")),
          ),
        );
    }
  }
}
