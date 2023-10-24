import 'package:dotted_border/dotted_border.dart';
import 'package:echo/screens/recorder_screen.dart';
import 'package:echo/utils/colors.dart';
import 'package:echo/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadPostScreen extends StatelessWidget {
  UploadPostScreen({super.key});
  final TextEditingController postController = TextEditingController();
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
                child: TextField(
                  controller: postController,
                  maxLength: 300,
                  maxLines: 5,
                  decoration: InputDecoration(border: InputBorder.none),
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
                          Image.asset("assets/images/audio_icon.png"),
                          Text("Upload Audio")
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                height: 60,
              ),
              CustomButton(voidCallback: () {}, title: "Save")
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
        title: CustomButton(voidCallback: () {}, title: "Local Storage"),
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
}
