import 'package:flutter/material.dart';


class CustomImageOrVideo extends StatefulWidget {
  final String? imageUrl;
 const CustomImageOrVideo({super.key, this.imageUrl});

  @override
  State<CustomImageOrVideo> createState() => _CustomImageOrVideoState();
}

class _CustomImageOrVideoState extends State<CustomImageOrVideo> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: widget.imageUrl == null
            ? const SizedBox(
                height: 0,
              ):Image.network(
                    height: height * .4,
                    width: width * width,
                    widget.imageUrl!,
                    fit: BoxFit.cover,
                  )
      ),
    );
  }

  /*play() {
    if (widget.controller!.value.isInitialized) {
      widget.controller!.play();
      widget.isPlaying = true;
    } else {
      widget.controller = VideoPlayerController.asset(widget.videoUrl!);
      widget.controller!.initialize().then((value) {
        widget.controller!.play();
        widget.isPlaying = true;
      });
    }
    setState(() {});
  }

  pause() {
    widget.controller!.pause();
    widget.isPlaying = false;
    setState(() {});
  }*/
}
