import 'package:fit_app/features/thoughts/presentation/views/widgets/audio_item.dart';
import 'package:fit_app/features/thoughts/presentation/views/widgets/video_item.dart';
import 'package:flutter/material.dart';

class CustomImageOrVideo extends StatelessWidget {
  final String? imageUrl;
  final String? videoUrl;
  final String? audioUrl;
  const CustomImageOrVideo({super.key, this.imageUrl, this.videoUrl, this.audioUrl});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: imageUrl == null && videoUrl==null && audioUrl==null
              ? const SizedBox(
                  height: 0,
                )
              : imageUrl==null && audioUrl ==null? 
              VideoItem(videoUrl: videoUrl!)
              :audioUrl==null? 
              Image.network(
                  height: height * .4,
                  width: width * width,
                  imageUrl!,
                  fit: BoxFit.cover,
                ):AudioItem(audioUrl: audioUrl,)),
    );
  }
}
