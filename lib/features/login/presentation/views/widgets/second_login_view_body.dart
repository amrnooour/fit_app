import 'package:fit_app/features/login/presentation/views/widgets/custom_container.dart';
import 'package:fit_app/features/login/presentation/views/widgets/first_container.dart';
import 'package:flutter/material.dart';

class SecondLoginViewBody extends StatelessWidget {
  const SecondLoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
          top: 0,
          child: FirstContainer(height: height * .4, width: width)),
        Positioned(
          bottom: 0,
          child: CustomContainer(height: height*.6, width: width))
      ],
    );
  }
}