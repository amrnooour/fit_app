import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final Widget icon;
  final void Function()? onTap;
  final Widget? trailing;
  const CustomListTile({super.key, required this.title, required this.icon, this.onTap, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListTile(
        onTap: onTap,
        title: Text(title,style: const TextStyle(fontWeight: FontWeight.bold),),
        leading: icon,
        trailing: trailing?? Icon( Icons.arrow_forward_ios_sharp,
          color: Colors.grey.withOpacity(.5),
        ),
      ),
    );
  }
}
