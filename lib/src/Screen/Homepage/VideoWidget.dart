// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:thebarberlao/src/ComponentsUtils/DialogPopupWidget.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({super.key});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoPlayerController? _controller;
  bool _initialized = false;
  bool _isPlaying = false;
  bool _disposed = false; // ✅ guard flag

  Future<void> _initVideo() async {
    if (_initialized || _disposed) return;
    final ctrl = VideoPlayerController.asset('assets/images/thebarberlao.mp4');
    try {
      await ctrl.initialize();
      if (_disposed || !mounted) { ctrl.dispose(); return; } // ✅ check ຫຼັງ await
      ctrl.setLooping(true);
      ctrl.setVolume(0);
      ctrl.play();
      setState(() {
        _controller = ctrl;
        _initialized = true;
        _isPlaying = true;
      });
    } catch (_) {
      ctrl.dispose();
      if (!_disposed && mounted) setState(() => _initialized = true);
    }
  }

  @override
  void dispose() {
    _disposed = true; // ✅ set ກ່ອນ dispose controller
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  void _togglePlay() {
    if (_controller == null || _disposed) return;
    setState(() {
      if (_controller!.value.isPlaying) {
        _controller!.pause();
        _isPlaying = false;
      } else {
        _controller!.play();
        _isPlaying = true;
      }
    });
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (_disposed) return; // ✅ ບໍ່ทำຫຍັງຖ້າ disposed ແລ້ວ
    if (info.visibleFraction > 0.1) {
      _initVideo();
    } else if (info.visibleFraction == 0) {
      if (_controller != null && _controller!.value.isInitialized) {
        _controller!.pause(); // ✅ safe — check initialized ກ່ອນ
      }
    } else if (_isPlaying) {
      if (_controller != null && _controller!.value.isInitialized) {
        _controller!.play();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('video_barberlao'),
      onVisibilityChanged: _onVisibilityChanged, // ✅ ແຍກເປັນ method
      child: GestureDetector(
        onTap: _togglePlay,
        child: AspectRatio(
          aspectRatio: _controller?.value.isInitialized == true
              ? _controller!.value.aspectRatio
              : 16 / 9,
          child: Stack(
            fit: StackFit.expand,
            children: [
              _controller?.value.isInitialized == true
                  ? VideoPlayer(_controller!)
                  : Container(
                color: Colors.black,
                child: Center(child: LoadDialog(context)),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 6,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _isPlaying
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _isPlaying ? 'Pause' : 'Play',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}