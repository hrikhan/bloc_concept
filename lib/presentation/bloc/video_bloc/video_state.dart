// video_state.dart
import 'package:tutor_management_system/model/video_model.dart';
import 'package:video_player/video_player.dart';

class VideoState {
  final bool loading;
  final List<VideoModel> videos;
  final Map<int, VideoPlayerController> controllers;

  VideoState({
    required this.loading,
    required this.videos,
    required this.controllers,
  });

  VideoState copyWith({
    bool? loading,
    List<VideoModel>? videos,
    Map<int, VideoPlayerController>? controllers,
  }) {
    return VideoState(
      loading: loading ?? this.loading,
      videos: videos ?? this.videos,
      controllers: controllers ?? this.controllers,
    );
  }
}
