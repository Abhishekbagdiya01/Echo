import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:echo/screens/upload_post_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:record/record.dart';

class RecorderScreen extends StatefulWidget {
  RecorderScreen({super.key});

  @override
  State<RecorderScreen> createState() => _RecorderScreenState();
}

class _RecorderScreenState extends State<RecorderScreen> {
  late final audioRecorder;
  late final audioPlayer;
  bool isRecording = false;
  String audioPath = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioRecorder = Record();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioRecorder.dispose();
  }

  Future startRecording() async {
    if (await audioRecorder.hasPermission()) {
      audioRecorder.start();
      isRecording = true;
      setState(() {});
    } else {
      log("Audio isn't recording");
    }
  }

  Future stopRecording() async {
    if (isRecording) {
      String path = await audioRecorder.stop();
      audioPath = path;
      isRecording = true;
      setState(() {
        isRecording = false;
      });
    } else {
      log("Something went wrong");
    }
  }

  Future playRecording() async {
    if (!isRecording && audioPath != "") {
      UrlSource urlSource = await UrlSource(audioPath);
      audioPlayer.play(urlSource);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: isRecording ? stopRecording : startRecording,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 60,
                child: isRecording == true
                    ? Icon(
                        Icons.pause,
                        color: Colors.white,
                        size: 100,
                      )
                    : Icon(
                        Icons.mic,
                        color: Colors.white,
                        size: 100,
                      ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: playRecording, child: Text("Play recording")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  log(audioPath);
                  if (audioPath != "") {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UploadPostScreen(audioFile: File(audioPath)),
                        ));
                  }
                },
                child: Text("Save"))
          ],
        ),
      ),
    );
  }
}
