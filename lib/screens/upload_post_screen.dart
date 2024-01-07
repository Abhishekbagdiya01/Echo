import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:echo/repository/post_repository.dart';
import 'package:echo/screens/recorder_screen.dart';
import 'package:echo/utils/shared_pref.dart';

import 'package:echo/widgets/custom_button.dart';
import 'package:echo/widgets/snackbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadPostScreen extends StatefulWidget {
  UploadPostScreen({this.audioFile, super.key});
  File? audioFile;

  @override
  State<UploadPostScreen> createState() => _UploadPostScreenState();
}

class _UploadPostScreenState extends State<UploadPostScreen> {
  final TextEditingController postController = TextEditingController();
  String? uid;
  String? token;
  getUidToken() async {
    uid = (await SharedPref().getUid())!;
    token = (await SharedPref().getRefreshToken())!;
    log("UID : $uid   || Token : $token");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUidToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          elevation: 5,
          shadowColor: Colors.black,
          title: Text(
            "Create Post",
            style: GoogleFonts.dmSans(fontWeight: FontWeight.bold),
          )),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      style: BorderStyle.solid,
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: postController,
                    maxLength: 300,
                    maxLines: 5,
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text("__________________________OR________________________"),
              SizedBox(
                height: 30,
              ),
              DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10),
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.10,
                    width: MediaQuery.sizeOf(context).width,
                    child: InkWell(
                      onTap: () {
                        showAlertDialog(context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          widget.audioFile != null
                              ? Icon(Icons.play_arrow)
                              : Image.asset("assets/images/audio_icon.png"),
                          Text("Upload Audio")
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                height: 60,
              ),
              CustomButton(
                  voidCallback: () async {
                    if (widget.audioFile != null ||
                        postController.text.isNotEmpty) {
                      //   audioFile!.readAsBytes();
                      if (postController.text.isNotEmpty &&
                          widget.audioFile == null) {
                        String message = await PostRepository().createPost(
                            uid!, "text", "", token!, postController.text);
                        Navigator.pop(context);
                        snackbarMessenger(context, message);
                      } else {
                        log("Not implemented yet");
                      }
                    }
                  },
                  title: "Save")
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: CustomButton(
            voidCallback: () {
              audioPickFromLocal();
            },
            title: "Local Storage"),
        content: CustomButton(
            voidCallback: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecorderScreen(),
                  ));
            },
            title: "Voice Recorder"),
        actions: [
          MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel")),
        ],
      ),
    );
  }

  void audioPickFromLocal() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    log("$result");
    if (result != null) {
      File file = File(result.files.single.path!);
      widget.audioFile = file;

      print(file);
    } else {
      // User canceled the picker
      log("something went wrong");
    }
  }
}
