import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/domain/repo/auth_repo.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/cubit/login_state.dart';



class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginUserWidthEmailAndPassword(
   
  ) async {
    emit(LoginLoading());
    final result = await authRepo.loginInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (user) => emit(LoginSuccess(userEntity: user)),
    );
  }
 
  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    final result = await authRepo.loginInWithGoogle();
    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (user) => emit(LoginSuccess(userEntity: user)),
    );
  }

  Future<void> loginWithFacebook() async {
    emit(LoginLoading());
    final result = await authRepo.loginInWithFacebook();
    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (user) => emit(LoginSuccess(userEntity: user)),
    );
  }

  Future<void> loginWithApple() async {
    emit(LoginLoading());
    final result = await authRepo.loginInWithApple();
    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (user) => emit(LoginSuccess(userEntity: user)),
    );
  }
}
