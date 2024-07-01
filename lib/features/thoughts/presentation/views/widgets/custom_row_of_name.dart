import 'package:flutter/material.dart';

class CustomRowOfName extends StatelessWidget {
  final String profileImage;
  final String name;
  final String weeks;
  const CustomRowOfName({super.key, required this.profileImage, required this.name, required this.weeks});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      image: NetworkImage(profileImage), fit: BoxFit.cover))),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              Text(weeks),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.delete,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
