import 'package:flutter/material.dart';

class CustomLoginButton extends StatelessWidget {
  final bool isEnabled;
  final String text;
  const CustomLoginButton({super.key, this.isEnabled = false, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isEnabled ? Colors.black : Colors.grey.withOpacity(.8)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            text,
            style: TextStyle(color: isEnabled ? Colors.yellow : Colors.white),
          ),
        ),
      ),
    );
  }
}
