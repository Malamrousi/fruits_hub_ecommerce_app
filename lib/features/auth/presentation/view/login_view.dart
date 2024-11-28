import 'package:flutter/material.dart';
import 'package:fruit_hub/generated/l10n.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: S.of(context).login),
      body:const SafeArea(child:  LoginViewBody()),
    );
  }
}