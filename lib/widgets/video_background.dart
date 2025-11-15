import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class VideoBackground extends StatefulWidget {
  final String assetPath;
  final Widget child;
  final double opacity;
  final BoxFit fit;
  final bool showControls;
  final double playbackSpeed;

  const VideoBackground({
    super.key,
    required this.assetPath,
    required this.child,
    this.opacity = 0.3,
    this.fit = BoxFit.cover,
    this.showControls = false,
    this.playbackSpeed = 0.5,
  });

  @override
  State<VideoBackground> createState() => _VideoBackgroundState();
}

class _VideoBackgroundState extends State<VideoBackground> {
  // For web/mobile - video_player
  VideoPlayerController? _videoPlayerController;
  
  // For desktop (Linux/Windows/macOS) - media_kit
  Player? _player;
  VideoController? _videoController;
  
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      if (kIsWeb) {
        // Use video_player for web
        _videoPlayerController = VideoPlayerController.asset(widget.assetPath);
        await _videoPlayerController!.initialize();
        await _videoPlayerController!.setLooping(true);
        await _videoPlayerController!.setVolume(0);
        await _videoPlayerController!.setPlaybackSpeed(widget.playbackSpeed);
        await _videoPlayerController!.play();
      } else {
        // Use media_kit for desktop (Linux/Windows/macOS)
        _player = Player();
        _videoController = VideoController(_player!);
        await _player!.open(Media('asset:///${widget.assetPath}'));
        await _player!.setPlaylistMode(PlaylistMode.loop);
        await _player!.setVolume(0.0);
        await _player!.setRate(widget.playbackSpeed);
      }
      
      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
    } catch (e) {
      debugPrint('Error initializing video: $e');
      // Fallback: show gradient background if video fails
      if (mounted) {
        setState(() {
          _isInitialized = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _player?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Video layer or gradient fallback
        if (_isInitialized)
          Positioned.fill(
            child: Opacity(
              opacity: widget.opacity,
              child: kIsWeb
                  ? FittedBox(
                      fit: widget.fit,
                      child: SizedBox(
                        width: _videoPlayerController!.value.size.width,
                        height: _videoPlayerController!.value.size.height,
                        child: VideoPlayer(_videoPlayerController!),
                      ),
                    )
                  : Video(
                      controller: _videoController!,
                      fit: widget.fit,
                    ),
            ),
          )
        else
          // Fallback gradient background
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF2563EB).withOpacity(0.3),
                    const Color(0xFF7C3AED).withOpacity(0.3),
                  ],
                ),
              ),
            ),
          ),
        
        // Gradient overlay for better text readability
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.1),
                ],
              ),
            ),
          ),
        ),

        // Content layer
        Positioned.fill(child: widget.child),

        // Optional controls (only for web with video_player)
        if (widget.showControls && _isInitialized && kIsWeb && _videoPlayerController != null)
          Positioned(
            bottom: 16,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      _videoPlayerController!.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _videoPlayerController!.value.isPlaying
                            ? _videoPlayerController!.pause()
                            : _videoPlayerController!.play();
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.replay, color: Colors.white),
                    onPressed: () {
                      _videoPlayerController!.seekTo(Duration.zero);
                      _videoPlayerController!.play();
                    },
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
