import 'package:flutter/material.dart';


class CustomCircularAvatar extends StatelessWidget {
  final ImageProvider<Object>? backgroundImage;
  final void Function()? onTap;
  const CustomCircularAvatar({super.key, this.backgroundImage, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade200,
      backgroundImage: backgroundImage,
      child: Stack(
        children: [
          Positioned(
            bottom: 5,
            right: 5,
            child: GestureDetector(
              onTap: () async {},
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.blue.shade400,
                  border: Border.all(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: GestureDetector(
                  onTap: onTap,
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
