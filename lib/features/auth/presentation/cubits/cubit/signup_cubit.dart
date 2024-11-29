import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  Future<void> createUserWidthEmailAndPassword() async {
    emit(SignupLoading());
    final result = await authRepo.createUserWidthEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text);
    result.fold(
      (failure) => emit(
        SignupFailure(message: failure.message),
      ),
      (user) => emit(
        SignupSuccess(userEntity: user),
      ),
    );
  }
}
