import 'package:fit_app/core/utils/constsnts.dart';
import 'package:flutter/material.dart';

class CustomRowOfName extends StatelessWidget {
  const CustomRowOfName({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
          image: const DecorationImage(image: NetworkImage(Constants.networkImage1),fit: BoxFit.cover))
          ),
        const SizedBox(width: 12,),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("nour"),
          Text("2 weeks ago"),
        ],),
        const Spacer(),
        const Icon(Icons.delete,color: Colors.grey,),
      ],),
    );
  }
}