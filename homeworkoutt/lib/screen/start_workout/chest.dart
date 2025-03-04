  import 'dart:async';
  import 'package:flutter/material.dart';
  import 'package:video_player/video_player.dart';

  class ChestWorkoutDetailPage extends StatefulWidget {
    const ChestWorkoutDetailPage({super.key});

    @override
    State<ChestWorkoutDetailPage> createState() => _ChestWorkoutDetailPageState();
  }

  class _ChestWorkoutDetailPageState extends State<ChestWorkoutDetailPage> {
    bool _isPaused = false;
    bool _isResting = false;
    int _currentExerciseIndex = 0;
    int _seconds = 30;
    int _restSeconds = 15;
    late Timer _timer;
    VideoPlayerController? _videoController;
    bool _isVideoInitialized = false;

    final List<Map<String, dynamic>> _exercises = [
      {"name": "PUSH-UPS", "video": "lib/assets/video/pushups.mp4", "duration": 30},
      {"name": "INCLINE PUSH-UPS", "video": "lib/assets/video/incline_pushups.mp4", "duration": 30},
      {"name": "DECLINE PUSH-UPS", "video": "lib/assets/video/decline_pushups.mp4", "duration": 30},
      {"name": "WIDE PUSH-UPS", "video": "lib/assets/video/wide_pushups.mp4", "duration": 30},
      {"name": "DIAMOND PUSH-UPS", "video": "lib/assets/video/diamond_pushups.mp4", "duration": 30},
      {"name": "CHAIR DIPS", "video": "lib/assets/video/chair_dips.mp4", "duration": 30},
    ];

    @override
    void initState() {
      super.initState();
      _initializeVideo();
      _startTimer();
    }

    void _initializeVideo() async {
      setState(() {
        _isVideoInitialized = false;
      });

      try {
        final controller = VideoPlayerController.asset(
          _exercises[_currentExerciseIndex]['video'],
          videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
        );

        // Add error listener
        controller.addListener(() {
          if (controller.value.hasError) {
            print('Video error: ${controller.value.errorDescription}');
          }
        });

        await controller.initialize();

        if (mounted) {
          setState(() {
            if (_videoController != null) {
              _videoController!.dispose();
            }
            _videoController = controller;
            _isVideoInitialized = true;
            // Loop the video
            _videoController!.setLooping(true);

            if (!_isPaused && !_isResting) {
              _videoController!.play();
            }
          });
        } else {
          controller.dispose();
        }
      } catch (e) {
        print('Error initializing video: $e');
        setState(() {
          _isVideoInitialized = false;
        });
      }
    }

    @override
    void dispose() {
      _timer.cancel();
      _videoController?.dispose();
      super.dispose();
    }

    void _startTimer() {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_isPaused) return;

        setState(() {
          if (_isResting) {
            if (_restSeconds > 0) {
              _restSeconds--;
            } else {
              _isResting = false;
              _seconds = _exercises[_currentExerciseIndex]["duration"];
              _videoController?.play();
            }
          } else {
            if (_seconds > 0) {
              _seconds--;
            } else {
              if (_currentExerciseIndex < _exercises.length - 1) {
                _isResting = true;
                _restSeconds = 15;
                _currentExerciseIndex++;
                _videoController?.pause();
                _initializeVideo();
              } else {
                timer.cancel();
                _videoController?.pause();
                _showWorkoutCompleteDialog();
              }
            }
          }
        });
      });
    }

    void _togglePause() {
      setState(() {
        _isPaused = !_isPaused;
        if (_isPaused) {
          _videoController?.pause();
        } else {
          if (!_isResting) {
            _videoController?.play();
          }
        }
      });
    }

    void _skipToNext() {
      if (_currentExerciseIndex < _exercises.length - 1) {
        setState(() {
          _currentExerciseIndex++;
          _seconds = _exercises[_currentExerciseIndex]["duration"];
          _isResting = false;
          _initializeVideo();
        });
      } else {
        _showWorkoutCompleteDialog();
      }
    }

    void _goToPrevious() {
      if (_currentExerciseIndex > 0) {
        setState(() {
          _currentExerciseIndex--;
          _seconds = _exercises[_currentExerciseIndex]["duration"];
          _isResting = false;
          _initializeVideo();
        });
      }
    }

    void _showWorkoutCompleteDialog() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text("Workout Complete!"),
          content: const Text("Congratulations on completing your chest workout!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Return to previous screen
              },
              child: const Text("DONE"),
            ),
          ],
        ),
      );
    }

    String _formatTime(int seconds) {
      final minutes = seconds ~/ 60;
      final remainingSeconds = seconds % 60;
      return "${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}";
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.videocam_outlined, color: Colors.grey),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.volume_up_outlined, color: Colors.grey),
              onPressed: () {
                // Toggle mute/unmute
                if (_videoController != null) {
                  final isMuted = _videoController!.value.volume == 0;
                  _videoController!.setVolume(isMuted ? 1.0 : 0.0);
                  setState(() {});
                }
              },
            ),
          ],
        ),
        body: Column(
          children: [
            // Video player area
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Exercise video or rest indicator
                    _isResting
                        ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.fitness_center, size: 80, color: Colors.blue),
                          const SizedBox(height: 16),
                          Text(
                            "REST",
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                        : Center(
                      child: _isVideoInitialized
                          ? AspectRatio(
                        aspectRatio: _videoController!.value.aspectRatio,
                        child: VideoPlayer(_videoController!),
                      )
                          : const CircularProgressIndicator(color: Colors.blue),
                    ),

                    // Feedback buttons
                    Positioned(
                      bottom: 20,
                      right: 0,
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade200,
                            radius: 24,
                            child: IconButton(
                              icon: const Icon(Icons.thumb_down, color: Colors.grey),
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(height: 12),
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade200,
                            radius: 24,
                            child: IconButton(
                              icon: const Icon(Icons.thumb_up, color: Colors.grey),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Exercise name
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(
                _isResting ? "REST TIME" : _exercises[_currentExerciseIndex]["name"],
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),

            // Timer
            Text(
              _isResting ? _formatTime(_restSeconds) : _formatTime(_seconds),
              style: const TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            // Pause button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: _togglePause,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(double.infinity, 0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(_isPaused ? Icons.play_arrow : Icons.pause, size: 28),
                    const SizedBox(width: 8),
                    Text(
                      _isPaused ? "RESUME" : "PAUSE",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Previous/Skip buttons
            Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    onPressed: _goToPrevious,
                    icon: const Icon(Icons.skip_previous, color: Colors.grey),
                    label: const Text(
                      "Previous",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton.icon(
                    onPressed: _skipToNext,
                    icon: const Text(
                      "Skip",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    label: const Icon(Icons.skip_next, color: Colors.grey),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      );
    }
  }