import 'package:flutter/material.dart';

class CustomLogoutButton extends StatelessWidget {
  final String text;
  const CustomLogoutButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: const Color(0xffEF4123)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
