abstract class SignupEvent {}


class UserSignup extends SignupEvent {
  final String name;
  final String email;
  final String phone;
  final String state;
  final String password;
  final String confirmPassword;

  UserSignup({
    required this.name,
    required this.email,
    required this.phone,
    required this.state,
    required this.password,
    required this.confirmPassword,
  });
}

class LoadSignup extends SignupEvent{}
