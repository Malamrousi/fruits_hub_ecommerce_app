import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/func/build_error_app_bar.dart';
import 'package:fruit_hub/core/helper/extension.dart';
import 'package:fruit_hub/core/routing/route_name.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/cubit/login_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/cubit/login_state.dart';
import 'package:fruit_hub/features/auth/presentation/view/widgets/login_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.pushNamed(RouteName.main);
        } else if (state is LoginFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading ? true : false,
          child: const LoginViewBody(),
        );
      },
    );
  }
}
