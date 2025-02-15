import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_services.dart';
import 'package:fruit_hub/features/auth/presentation/view/widgets/login_view_body_bloc_consumer.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../cubits/cubit/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIT.get<LoginCubit>(),
      child: Scaffold(
        appBar: buildAppBar(context: context, title: "تسجيل الدخول"),
        body: const SafeArea(child: LoginViewBodyBlocConsumer()),
      ),
    );
  }
}
