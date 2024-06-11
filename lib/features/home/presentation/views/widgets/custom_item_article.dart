import 'package:flutter/material.dart';

class CustomItemArticle extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String subTitle;
  final void Function()? onTap;
  const CustomItemArticle({super.key, required this.imageUrl, required this.name, required this.subTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width * .6,
          height: height * .6,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(name),
              const SizedBox(
                height: 5,
              ),
              Text(
                subTitle,
                maxLines: 2,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}