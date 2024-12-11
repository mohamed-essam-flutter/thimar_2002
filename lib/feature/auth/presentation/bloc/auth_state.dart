class AuthState {}

class AuthInitial extends AuthState {}

//register
class RegisterLoadingState extends AuthState {}

class RegisterLoadedState extends AuthState {}

class RegisterErrorState extends AuthState {
  final String error;
  RegisterErrorState({required this.error});
}

//login
class LoginLoadingState extends AuthState {}

class LoginLoadedState extends AuthState {}

class LoginErrorState extends AuthState {
  final String error;
  LoginErrorState({required this.error});
}

//forgotPassword
class ForgotPasswordLoadingState extends AuthState {}

class ForgotPasswordLoadedState extends AuthState {}

//cheek code
class CheckCodeLoadingState extends AuthState {}

class CheckCodeLoadedState extends AuthState {}
