import 'package:echo/utils/colors.dart';
import 'package:echo/widgets/audio_player.dart';
import 'package:echo/widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class postCard extends StatefulWidget {
  postCard({
    Key? key,
    required this.username,
    required this.profileUrl,
    required this.location,
    required this.content,
    required this.postType,
  }) : super(key: key);
  final String username;
  final String profileUrl;
  final String location;
  final String content;
  final String postType;

  @override
  State<postCard> createState() => _postCardState();
}

class _postCardState extends State<postCard> {
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: goldenThemeColor)],
              border: Border.all(color: Colors.grey)),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(widget.profileUrl),
                ),
                title: Text(
                  widget.username,
                  style: GoogleFonts.roboto(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  widget.location,
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
                child: widget.postType == "Text"
                    ? Text(
                        widget.content,
                        style: GoogleFonts.roboto(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      )
                    : AudioPlayerLayout(audioUrl: widget.content),
              ),
              const Divider(
                thickness: 2,
              ),
              ListTile(
                leading: InkWell(
                  onTap: () {
                    if (isLike) {
                      isLike = false;
                      setState(() {});
                    } else {
                      isLike = true;
                      setState(() {});
                    }
                  },
                  child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * .45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.thumb_up,
                            color: isLike
                                ? Colors.red
                                : Colors.black.withOpacity(0.6),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            isLike ? "13" : "12",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: isLike
                                    ? Colors.red
                                    : Colors.black.withOpacity(0.6)),
                          )
                        ],
                      )),
                ),
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
          height: 20,
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
