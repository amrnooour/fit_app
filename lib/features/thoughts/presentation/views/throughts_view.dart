import 'package:fit_app/features/thoughts/presentation/views/widgets/throught_view_body.dart';
import 'package:flutter/material.dart';

class ThroughtsView extends StatelessWidget {
  const ThroughtsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.1),
      appBar: AppBar(title: const Text("Thoughts"), centerTitle: true,elevation: 0,
      backgroundColor: Colors.white,),
      body: const ThroughtViewBody(),
    );
  }
}