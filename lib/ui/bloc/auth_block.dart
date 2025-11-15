import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testerapps/data/remote/student_api.dart';

abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String nisn;
  final String password;

  LoginButtonPressed({required this.nisn, required this.password});
}

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String token;
  final String name;

  LoginSuccess(this.token, this.name);
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final StudentApi studentApi;

  LoginBloc(this.studentApi) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    try {
      // Call login API
      final result = await studentApi.login(event.nisn, event.password);

      // Save token to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', result.token);

      // Emit success state
      emit(LoginSuccess(result.token, result.name));
      print('Login Success: Welcome ${result.name}, Token: ${result.token}');
    } catch (e) {
      emit(LoginFailure("Login failed: ${e.toString()}"));
    }
  }
}
