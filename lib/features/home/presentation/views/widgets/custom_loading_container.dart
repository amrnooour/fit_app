import 'package:flutter/material.dart';

class CustomLoadingContainer extends StatelessWidget {
  const CustomLoadingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      height: MediaQuery.of(context).size.height * .4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),),
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}