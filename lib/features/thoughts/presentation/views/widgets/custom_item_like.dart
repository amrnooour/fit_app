import 'package:flutter/material.dart';

class CustomItemLike extends StatelessWidget {
  final IconData? icon;
  final String text;
  final void Function()? onTap;
  const CustomItemLike({super.key, this.icon, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
        Icon(icon,size: 20,),
        const SizedBox(width: 9,),
        Text(text),
      ],),
    );
  }
}