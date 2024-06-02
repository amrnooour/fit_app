import 'package:fit_app/features/login/presentation/views/widgets/second_login_view_body.dart';
import 'package:flutter/material.dart';

class SecondLoginView extends StatelessWidget {
  const SecondLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SecondLoginViewBody(),
    );
  }
}