import 'package:fit_app/features/thoughts/presentation/views/widgets/throught_view_body.dart';
import 'package:flutter/material.dart';

class ThroughtsView extends StatelessWidget {
  const ThroughtsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ThroughtViewBody(),
    );
  }
}