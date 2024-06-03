import 'package:fit_app/features/diet/presentation/views/diet_view_body.dart';
import 'package:flutter/material.dart';

class DietView extends StatelessWidget {
  const DietView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DietViewBody(),
    );
  }
}