import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioItem extends StatefulWidget {
  final String? audioUrl;
  const AudioItem({super.key, this.audioUrl});

  @override
  State<AudioItem> createState() => _AudioItemState();
}

class _AudioItemState extends State<AudioItem> {
  late AudioPlayer audioPlayer;
  bool isPlaying = false;
  @override
  void initState() {
    audioPlayer = AudioPlayer();
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
          onPressed: togglePlayPause,
          icon: Icon(
            isPlaying ? Icons.pause : Icons.play_arrow,
            size: 30,
            color: Colors.black,
          )),
    );
  }

  void togglePlayPause() {
    if (isPlaying) {
      audioPlayer.pause();
    } else {
      audioPlayer.play(AssetSource(widget.audioUrl!));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }
}
