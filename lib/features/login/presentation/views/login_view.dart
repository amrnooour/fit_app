import 'package:fit_app/features/login/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: LoginViewBody(),
    );
  }
}
