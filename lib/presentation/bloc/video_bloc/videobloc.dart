// video_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutor_management_system/model/video_model.dart';
import 'package:tutor_management_system/presentation/bloc/video_bloc/event.dart';
import 'package:tutor_management_system/presentation/bloc/video_bloc/video_state.dart';
import 'package:video_player/video_player.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc() : super(VideoState(loading: true, videos: [], controllers: {})) {
    on<LoadVideos>(_onLoadVideos);
  }

  Future<void> _onLoadVideos(LoadVideos event, Emitter<VideoState> emit) async {
    emit(state.copyWith(loading: true));

    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));

    List<VideoModel> videoList = [
      VideoModel(
        id: '1',
        title: 'Sample 1',
        videoUrl:
            'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
        teacherName: 'Mr. John',
      ),
      VideoModel(
        id: '2',
        title: 'Sample 2',
        videoUrl:
            'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_5mb.mp4',
        teacherName: 'Ms. Emma',
      ),
      VideoModel(
        id: '3',
        title: 'Sample 3',
        videoUrl:
            'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_10mb.mp4',
        teacherName: 'Mr. Smith',
      ),
      VideoModel(
        id: '4',
        title: 'Sample 4',
        videoUrl:
            'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4',
        teacherName: 'Ms. Lily',
      ),
      VideoModel(
        id: '5',
        title: 'Sample 5',
        videoUrl:
            'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_30mb.mp4',
        teacherName: 'Mr. Kevin',
      ),
      VideoModel(
        id: '6',
        title: 'Sample 6',
        videoUrl:
            'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_50mb.mp4',
        teacherName: 'Ms. Sarah',
      ),
      VideoModel(
        id: '7',
        title: 'Sample 7',
        videoUrl:
            'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_100mb.mp4',
        teacherName: 'Mr. David',
      ),
      VideoModel(
        id: '8',
        title: 'Sample 8',
        videoUrl:
            'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_250mb.mp4',
        teacherName: 'Ms. Anna',
      ),
      VideoModel(
        id: '9',
        title: 'Sample 9',
        videoUrl:
            'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_500mb.mp4',
        teacherName: 'Mr. Robert',
      ),
      VideoModel(
        id: '10',
        title: 'Sample 10',
        videoUrl:
            'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_700mb.mp4',
        teacherName: 'Ms. Maria',
      ),
    ];

    Map<int, VideoPlayerController> controllers = {};
    for (int i = 0; i < videoList.length; i++) {
      final controller = VideoPlayerController.network(videoList[i].videoUrl);
      controllers[i] = controller;
      await controller.initialize();
      controller.setLooping(true);
    }

    emit(
      VideoState(videos: videoList, controllers: controllers, loading: false),
    );
  }

  void play(int index) => state.controllers[index]?.play();
  void pause(int index) => state.controllers[index]?.pause();

  @override
  Future<void> close() {
    state.controllers.forEach((_, c) => c.dispose());
    return super.close();
  }
}
