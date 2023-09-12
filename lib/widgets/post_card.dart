import 'package:echo/utils/colors.dart';
import 'package:echo/widgets/audio_player.dart';
import 'package:echo/widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class postCard extends StatelessWidget {
  postCard({
    Key? key,
    required this.username,
    required this.location,
    required this.content,
    required this.postType,
  }) : super(key: key);
  final String username;
  final String location;
  final String content;
  final String postType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey)),
          child: Column(
            children: [
              ListTile(
                leading: const CircleAvatar(
                  radius: 30,
                ),
                title: Text(
                  username,
                  style: GoogleFonts.roboto(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  location,
                  style: GoogleFonts.roboto(fontSize: 18, color: Colors.grey),
                ),
                trailing: OutlinedButton(
                  onPressed: () {},
                  child: const Text("Follow"),
                ),
              ),

              // CONTENT PART
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: postType == "Text"
                    ? Text(
                        content,
                        style: GoogleFonts.roboto(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      )
                    : AudioPlayerLayout(audioUrl: content),
              ),
              const Divider(
                thickness: 2,
              ),
              ListTile(
                leading: SizedBox(
                    width: MediaQuery.sizeOf(context).width * .45,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.thumb_up),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Like",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ],
                    )),
                trailing: InkWell(
                  onTap: () {
                    bottomCommentSheet(context);
                  },
                  child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * .45,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageIcon(
                              AssetImage("assets/images/comment_icon.png")),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Comments",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  void bottomCommentSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.sizeOf(context).height * .6,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Comments",
                style:
                    interTextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Divider(
                thickness: 2,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextField(
                      decoration: InputDecoration(
                          hintText: "Add comments for...",
                          suffixIcon: Icon(Icons.send),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
