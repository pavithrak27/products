abstract class SignupState {}



class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final String name;
  final String email;
  final String phone;
  final String state;
  final String password;

  SignupSuccess({required this.name,required this.email,required this.phone,required this.state,required this.password});
}

class SignupFailure extends SignupState {
  final String message;

  SignupFailure({required this.message});
}

