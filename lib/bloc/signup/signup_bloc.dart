import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/bloc/signup/signup_event.dart';
import 'package:products/bloc/signup/signup_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<UserSignup>(_signup);
    on<LoadSignup>(_loadsignup);
  }

  Future<void> _signup(UserSignup event, Emitter<SignupState> emit) async {
    emit(SignupLoading());
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', event.name);
      await prefs.setString('email', event.email);
      await prefs.setString('phone', event.phone);
      await prefs.setString('state', event.state);
      await prefs.setString('state', event.password);

      emit(
        SignupSuccess(
          name: event.name,
          email: event.email,
          phone: event.phone,
          state: event.state,
          password: event.password,
        ),
      );
    } catch (e) {
      emit(SignupFailure(message: e.toString()));
    }
  }

  Future<void> _loadsignup(LoadSignup event, Emitter<SignupState> emit) async {
    emit(SignupLoading());

    try {
      final prefs = await SharedPreferences.getInstance();

      final name = prefs.getString('name');
      final email = prefs.getString('email');
      final phone = prefs.getString('phone');
      final state = prefs.getString('state');
      final password = prefs.getString('password');
      if (name == null ||
          email == null ||
          phone == null ||
          state == null ||
          password == null) {
        return emit(SignupFailure(message: 'No saved user data found'));
      }
      emit(
        SignupSuccess(
          name: name,
          email: email,
          phone: phone,
          state: state,
          password: password,
        ),
      );
    } catch (e) {
      emit(SignupFailure(message: e.toString()));
    }
  }
}
