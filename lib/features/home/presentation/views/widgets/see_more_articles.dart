import 'package:fit_app/features/home/presentation/views/widgets/see_more_articles_body.dart';
import 'package:flutter/material.dart';

class SeeMoreArticlesView extends StatelessWidget {
  const SeeMoreArticlesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Articles"),centerTitle: true,),
      body: const SeeMoreArticlesViewBody(),
    );
  }
}