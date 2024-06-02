import 'package:fit_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FirstContainer extends StatefulWidget {
  final double height;
  final double width;
  const FirstContainer({super.key, required this.height, required this.width});

  @override
  State<FirstContainer> createState() => _FirstContainerState();
}

class _FirstContainerState extends State<FirstContainer> {
  late VideoPlayerController controller;
  void initState() {
    controller = VideoPlayerController.asset(AppAssets.splah2);
    controller.initialize().then((value) {
      controller.play();
      controller.setLooping(true);
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: VideoPlayer(controller)),
    );
  }
}
