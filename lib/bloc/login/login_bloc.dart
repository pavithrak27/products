import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/bloc/login/login_event.dart';
import 'package:products/bloc/login/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<UserLogin>(_login);
  }

  Future<void> _login(UserLogin event, Emitter<LoginState> emit) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final savedPhone = prefs.getString('phone');
      final savedPassword = prefs.getString('password');

      if (savedPhone == null || savedPassword == null) {
        emit(LoginFailure(message: "User not Found.signup first"));
      }
      if (event.phone == savedPhone && event.password == savedPassword) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure(message: "Invalid Credentials"));
      }
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }
}
