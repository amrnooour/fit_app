import 'package:fit_app/features/thoughts/presentation/views/widgets/custom_image_or_video.dart';
import 'package:fit_app/features/thoughts/presentation/views/widgets/custom_row_of_like.dart';
import 'package:fit_app/features/thoughts/presentation/views/widgets/custom_row_of_name.dart';
import 'package:flutter/material.dart';


class CustomItemPost extends StatelessWidget {
  final String? imageUrl;
  final String? videoUrl;
  final String? audioUrl;

 const CustomItemPost({super.key, this.imageUrl, this.videoUrl, this.audioUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15,),
          const CustomRowOfName(),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Amr Nour"),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomImageOrVideo(
            imageUrl: imageUrl,
            videoUrl: videoUrl,
            audioUrl: audioUrl,
          ),
          const SizedBox(
            height: 30,
          ),
          const CustomRowOfLike(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
