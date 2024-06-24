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
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
   String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }

  @override
  void initState() {
    audioPlayer = AudioPlayer();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
            min: 0,
            max: duration.inSeconds.toDouble(),
            value: position.inSeconds.toDouble(),
            onChanged: (value) {
              final postion = Duration(seconds: value.toInt());
              audioPlayer.seek(postion);
              audioPlayer.resume();
            }),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatTime(position.inSeconds)),
                  IconButton(
                  onPressed: togglePlayPause,
                  icon: Icon(
                     isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 30,
                      color: Colors.black,
                 )),
                  Text(formatTime((duration - position).inSeconds)),
                ],
              ),
            ),
      ],
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
