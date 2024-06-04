import 'package:fit_app/core/utils/app_assets.dart';
import 'package:fit_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String name;
  final String description;
  final String textButton;

  const CustomListItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.name,
      required this.description, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .8,
      height: MediaQuery.of(context).size.height * .4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: NetworkImage(
                imageUrl
              ),
              fit: BoxFit.fill)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Styles.title,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: Styles.name,
              maxLines: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: Styles.description,
              maxLines: 5,
            ),
            const SizedBox(
              height: 10,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    AppAssets.logo,
                    height: 40,
                    width: 40,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: 70,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.orange),
                  child: Center(child: Text(textButton,style: const TextStyle(color: Colors.white),maxLines: 1,)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
