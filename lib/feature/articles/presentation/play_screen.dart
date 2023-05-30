import 'package:flutter/material.dart';
import 'package:healthy_mind/helpers/app_colors.dart';
import 'package:healthy_mind/helpers/app_images.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';
import 'package:just_audio/just_audio.dart';
import 'package:share_plus/share_plus.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen(
      {super.key, required this.mp3, required this.title, required this.image});
  final String mp3;
  final String title;
  final String image;

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  int sec15 = 0;
  final _player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _musicInit();
  }

  _musicInit() async {
    var totalTime = await _player.setAsset(widget.mp3);
    duration = _player.duration!;
    setState(() {});

    _player.positionStream.listen((event) {
      Duration temp = event;
      position = temp;
      setState(() {});
    });
  }

  _playerAction() {
    if (isPlaying) {
      _player.pause();
      isPlaying = false;
    } else {
      _player.play();
      isPlaying = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  BackButton(
                    onPressed: () {
                      _player.pause();
                      isPlaying = false;
                      Navigator.pop(context);
                    },
                    color: Colors.black,
                  ),
                  const Spacer(),
                  const SizedBox(width: 20),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(widget.image), fit: BoxFit.cover),
                ),
              ),
              const Spacer(),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                divisions: 100,
                onChanged: (value) {
                  final seekPosition = Duration(seconds: value.toInt());
                  _player.seek(seekPosition);
                  setState(() {});
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatTime(position),
                      style: const TextStyle(
                        color: AppColors.color38B6FFBLue,
                      ),
                    ),
                    Text(
                      formatTime(duration),
                      style: const TextStyle(
                        color: AppColors.color38B6FFBLue,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: AppTextStyles.s24W500(color: Colors.black),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      if (position.inSeconds < 15) {
                        _player.seek(
                          const Duration(seconds: 0),
                        );
                      } else {
                        _player.seek(
                          Duration(seconds: position.inSeconds - 15),
                        );
                      }

                      setState(() {});
                    },
                    child: Image.asset(
                      AppImages.leftIcon,
                      width: 30,
                    ),
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: () {
                      _playerAction();
                    },
                    icon: isPlaying
                        ? const Icon(Icons.pause, size: 50)
                        : const Icon(Icons.play_arrow, size: 50),
                  ),
                  const SizedBox(width: 40),
                  InkWell(
                    onTap: () {
                      if (duration.inSeconds - 15 < position.inSeconds) {
                        _player.seek(
                          Duration(seconds: duration.inSeconds),
                        );
                      } else {
                        _player.seek(
                          Duration(seconds: position.inSeconds + 15),
                        );
                      }

                      setState(() {});
                    },
                    child: Image.asset(
                      AppImages.rightIcon,
                      width: 30,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Share.shareFiles([widget.mp3], text: widget.title);
                },
                icon: const Icon(
                  Icons.ios_share,
                  size: 30,
                  color: AppColors.color38B6FFBLue,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  String formatTime(Duration value) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(value.inHours);
    final min = twoDigits(value.inMinutes.remainder(60));
    final sec = twoDigits(value.inSeconds.remainder(60));
    return [
      if (value.inHours > 0) hours,
      min,
      sec,
    ].join(':');
  }
}
