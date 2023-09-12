import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerLayout extends StatefulWidget {
  AudioPlayerLayout({super.key, required this.audioUrl});
  final audioUrl;
  @override
  State<AudioPlayerLayout> createState() => _AudioPlayerLayoutState();
}

class _AudioPlayerLayoutState extends State<AudioPlayerLayout> {
  bool isPlay = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          IconButton(
            icon: isPlay ? Icon(Icons.pause_circle) : Icon(Icons.play_circle),
            onPressed: () async {
              final player = AudioPlayer();

              if (isPlay) {
                await player.pause().then((value) {
                  print(isPlay);
                  setState(() {
                    isPlay = false;
                  });
                });
              } else {
                await player.play(UrlSource(widget.audioUrl));
                print(isPlay);
                setState(() {
                  isPlay = true;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
