import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(PhoneNumber)? onChanged;
  const CustomInput({super.key, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      autovalidateMode: AutovalidateMode.disabled,
      dropdownIconPosition: IconPosition.trailing,
      initialCountryCode: "EG",
      languageCode: "Eg",
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        counterText: "",
        hintText: "    Please enter your phone number",
        hintStyle: TextStyle(color: Colors.grey.withOpacity(.5), fontSize: 12),
        fillColor: Colors.grey.withOpacity(.05),
        filled: true,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withOpacity(.1)));
  }
}
