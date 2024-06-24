import 'package:flutter/material.dart';

class ImageDetails extends StatelessWidget {
  final String image;
  const ImageDetails({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: InteractiveViewer(
              child: Image.network(
                  height: height , width: width, fit: BoxFit.cover, image),
            ),
          ),
        ),
      ),
    );
  }
}
