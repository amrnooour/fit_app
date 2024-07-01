import 'package:fit_app/features/thoughts/presentation/views/widgets/custom_image_or_video.dart';
import 'package:fit_app/features/thoughts/presentation/views/widgets/custom_row_of_like.dart';
import 'package:fit_app/features/thoughts/presentation/views/widgets/custom_row_of_name.dart';
import 'package:flutter/material.dart';

class CustomItemPost extends StatelessWidget {
  final String? imageUrl;
  final String? videoUrl;
  final String? audioUrl;
  final String profileImage;
  final String title;
  final String name;
  final String weeks;
  final void Function()? onTap;

  const CustomItemPost(
      {super.key,
      this.imageUrl,
      this.videoUrl,
      this.audioUrl,
      required this.profileImage,
      required this.name,
      required this.weeks, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            CustomRowOfName(
              name: name,
              profileImage: profileImage,
              weeks: weeks,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(title),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: onTap,
              child: CustomImageOrVideo(
                imageUrl: imageUrl,
                videoUrl: videoUrl,
                audioUrl: audioUrl,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomRowOfLike(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
