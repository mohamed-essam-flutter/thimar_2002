import 'package:t7mara/feature/auth/data/models/request/login_params.dart';
import 'package:t7mara/feature/auth/data/models/request/register_params.dart';

class AuthEvent {}

//register
class RegisterEvent extends AuthEvent {
  final RegisterParams params;

  RegisterEvent({required this.params});
}

//login
class LoginEvent extends AuthEvent {
  final LoginParams params;

  LoginEvent({required this.params});
}

class ForgotPasswordEvent extends AuthEvent {
  final String phone;

  ForgotPasswordEvent({required this.phone});
}

class CheckCodeEvent extends AuthEvent {
  final String code;
  final String phone;
  CheckCodeEvent({required this.code, required this.phone});
}
