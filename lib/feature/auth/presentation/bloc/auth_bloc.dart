import 'package:bloc/bloc.dart';
import 'package:t7mara/core/services/local_storage_application.dart';
import 'package:t7mara/feature/auth/data/repo/auth_repo.dart';
import 'package:t7mara/feature/auth/presentation/bloc/auth_event.dart';
import 'package:t7mara/feature/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>(register);
    on<LoginEvent>(login);
    on<ForgotPasswordEvent>(forgotPassword);
    on<CheckCodeEvent>(cheekCode);
  }
  Future<void> register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());
    //api
    await AuthRepo.registerRepo(event.params).then(
      (value) {
        if (value != null) {
          emit(RegisterLoadedState());
        } else {
          emit(RegisterErrorState(error: ""));
        }
      },
    );
  }

  Future<void> login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    //api
    await AuthRepo.loginRepo(event.params).then(
      (value) {
        if (value != null) {
          LocalStorage.cacheData(
              key: LocalStorage.token, value: value.data?.token);

          emit(LoginLoadedState());
        } else {
          emit(LoginErrorState(error: ""));
        }
      },
    );
  }

  //forgot password
  Future<void> forgotPassword(
      ForgotPasswordEvent event, Emitter<AuthState> emit) async {
    emit(ForgotPasswordLoadingState());
    //api
    await AuthRepo.forgotPasswordRepo(event.phone).then(
      (value) {
        if (value == true) {
          // LocalStorage.cacheData(
          //     key: LocalStorage.token, value: value.data?.token);
          emit(ForgotPasswordLoadedState());
        } else {
          emit(LoginErrorState(error: ""));
        }
      },
    );
  }

  //cheek code
  Future<void> cheekCode(CheckCodeEvent event, Emitter<AuthState> emit) async {
    emit(CheckCodeLoadingState());
    //api
    await AuthRepo.checkCodeRepo(event.phone, event.code).then(
      (value) {
        if (value == true) {
          // LocalStorage.cacheData(
          //     key: LocalStorage.token, value: value.data?.token);
          emit(CheckCodeLoadedState());
        } else {
          emit(LoginErrorState(error: ""));
        }
      },
    );
  }
}
