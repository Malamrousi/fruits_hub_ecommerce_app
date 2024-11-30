import 'package:flutter/material.dart';
import 'package:fruit_hub/core/services/get_it_services.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/view/widgets/sign_up_view_body_bloc_consumer.dart';

import '../../../../generated/l10n.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIT.get<SignupCubit>(),
      child: Scaffold(
        appBar: buildAppBar(title: S.of(context).signup, context: context),
        body: const SafeArea(child: SignUpViewBodyBlocConsumer()),
      ),
    );
  }
}

