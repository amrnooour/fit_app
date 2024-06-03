import 'package:fit_app/features/workout/presentation/views/widgets/workout_view_body.dart';
import 'package:flutter/material.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WorkoutViewBody(),
    );
  }
}