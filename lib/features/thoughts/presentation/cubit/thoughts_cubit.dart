import 'package:fit_app/features/thoughts/presentation/cubit/thoughts_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class ThoughtsCubit extends Cubit<ThoughtsStates> {
  ThoughtsCubit() : super(ThoughtsIntial());

  VideoPlayerController? controller;
  String? videoUrl;

  Future<void> loadVideo(String videoUrl) async {
    emit(VideoLoading());
     if (controller != null) {
      controller!.play();
      emit(VideoPlay());
    }else{
    videoUrl = videoUrl;
    controller = VideoPlayerController.asset(videoUrl);
    await controller!.initialize();
    emit(VideoLoaded(controller!));
    }
  }

  void pauseVideo() {
    if (controller != null) {
      controller!.pause();
      emit(VidepPause());
    }
  }

  @override
  Future<void> close() {
    controller?.dispose();
    return super.close();
  }
}
