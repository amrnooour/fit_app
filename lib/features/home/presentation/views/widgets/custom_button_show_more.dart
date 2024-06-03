import 'package:flutter/material.dart';

class CustomButtonShowMore extends StatelessWidget {
  const CustomButtonShowMore({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
            radius: 15,
            backgroundColor: Colors.red,
            child: CircleAvatar(
              radius: 13,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 9,
                backgroundColor:Colors.red,
              child: Icon(Icons.arrow_forward_sharp,size: 9,color: Colors.white,))
            ));
  }
}