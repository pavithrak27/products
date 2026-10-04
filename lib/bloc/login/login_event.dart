abstract class LoginEvent {}

class UserLogin extends LoginEvent{
  final String phone;
  final String password;

  UserLogin({required this.phone,required this.password});
}


