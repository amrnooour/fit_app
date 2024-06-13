import 'package:video_player/video_player.dart';

class ThoughtsStates {}

class ThoughtsIntial extends ThoughtsStates {}

class VideoLoading extends ThoughtsStates {}

class VideoLoaded extends ThoughtsStates {
  VideoPlayerController controller;
  VideoLoaded(this.controller);
}

class VideoPlay extends ThoughtsStates {}

class VidepPause extends ThoughtsStates {}
