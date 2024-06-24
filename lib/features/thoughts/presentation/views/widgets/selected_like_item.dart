import 'package:flutter/material.dart';

class SelectedLikeItem extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const SelectedLikeItem({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: const Center(
                child: Icon(
              Icons.thumb_up_alt_outlined,
              color: Colors.white,
            )),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(text),
        ],
      ),
    );
  }
}
