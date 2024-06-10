import 'package:fit_app/features/home/presentation/views/widgets/see_more_stories_view_body.dart';
import 'package:flutter/material.dart';

class SeeMoreStoriesView extends StatelessWidget {
  const SeeMoreStoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Success Stories"),centerTitle: true,),
      body: const SeeMoreStoriesViewBody(),
    );
  }
}