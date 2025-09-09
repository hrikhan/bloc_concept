import 'package:flutter/material.dart';
import 'package:tutor_management_system/model/video_model.dart';
import 'package:tutor_management_system/presentation/screen/home_screen/videoplayer_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoCard extends StatefulWidget {
  final VideoModel video;
  final VideoPlayerController controller;

  const VideoCard({super.key, required this.video, required this.controller});

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller;

    // Listen to controller changes and rebuild
    controller.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to full-screen video player
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => VideoPlayerScreen(
              videoUrl: widget.video.videoUrl,
              title: widget.video.title,
              video: widget.video, // optional, if needed
            ),
          ),
        );
      },
      child: VisibilityDetector(
        key: Key(widget.video.id),
        onVisibilityChanged: (info) {
          if (info.visibleFraction > 0.5) {
            controller.play();
          } else {
            controller.pause();
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 200,
              child: controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: VideoPlayer(controller),
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
            if (!controller.value.isPlaying && controller.value.isInitialized)
              const Icon(Icons.play_arrow, color: Colors.white, size: 50),
            Positioned(
              bottom: 8,
              left: 8,
              child: Text(
                "${widget.video.title} - ${widget.video.teacherName}",
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
