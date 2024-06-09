import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? hintText;
  final bool? typing;
  const CustomTextField({super.key, this.onChanged, this.controller, this.hintText, this.typing});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      enabled: typing,
      decoration: InputDecoration(
        disabledBorder: buildBorder(),
        hintText: hintText?? "code",
        hintStyle: const TextStyle(color: Colors.grey),
        fillColor: Colors.grey.withOpacity(.1),
        filled: true,
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        border: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withOpacity(.1)));
  }
}
