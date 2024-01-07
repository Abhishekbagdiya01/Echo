import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:echo/repository/post_repository.dart';
import 'package:echo/utils/colors.dart';
import 'package:echo/widgets/audio_player.dart';
import 'package:echo/widgets/text_styles.dart';
import 'package:http/http.dart';

class postCard extends StatefulWidget {
  postCard({
    Key? key,
    this.uid,
    this.token,
    required this.username,
    required this.profileUrl,
    required this.content,
    required this.postType,
    required this.postid,
    required this.comments,
    required this.likes,
  }) : super(key: key);

  final String? uid;
  final String? token;
  final String username;
  final String profileUrl;

  final String content;
  final String postType;
  final String postid;
  final List comments;
  final List likes;

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
                  onTap: () async {
                    log("token : ${widget.token} || uid: ${widget.uid} ");
                    if (widget.likes.contains(widget.uid)) {
                      final response = await PostRepository().dislikePost(
                          widget.uid!, widget.postid, widget.token!);
                      print(response);
                      setState(() {});
                    } else {
                      final response = await PostRepository()
                          .likePost(widget.uid!, widget.postid, widget.token!);
                      print(response);
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
                            color: widget.likes.contains(widget.uid)
                                ? Colors.red
                                : Colors.black.withOpacity(0.6),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            isLike
                                ? "${widget.likes.length}"
                                : "${widget.likes.length}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: widget.likes.contains(widget.uid)
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
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.3,
                child: ListView.builder(
                  itemCount: widget.comments.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(""),
                  ),
                ),
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
