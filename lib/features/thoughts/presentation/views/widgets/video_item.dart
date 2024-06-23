import 'package:fit_app/core/utils/constsnts.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoItem extends StatefulWidget {
  final String? videoUrl;
  const VideoItem({super.key, this.videoUrl});

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late VideoPlayerController? controller;
  bool isPlaying = false;
  bool isInitialized = false;
  @override
  void initState() {
    controller = VideoPlayerController.asset(widget.videoUrl!);
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SizedBox(
            height: height * .4,
            width: width * width,
            child: isInitialized
                ? VideoPlayer(controller!)
                : Image.network(
                    Constants.networkImage,
                    fit: BoxFit.cover,
                  )),
        Positioned(
          top: height * .15,
          width: width * .9,
          child: IconButton(
              onPressed: togglePlayPause,
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                size: 50,
                color: Colors.white,
              )),
        )
      ],
    );
  }

  void togglePlayPause() async {
    if (!isInitialized) {
      await controller!.initialize();
      setState(() {
        isInitialized = true;
      });
    }
    setState(() {
      if (controller!.value.isPlaying) {
        controller!.pause();
      } else {
        controller!.play();
      }
      isPlaying = !isPlaying;
    });
  }
}
