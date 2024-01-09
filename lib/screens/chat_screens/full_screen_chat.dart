import 'package:echo/repository/chat_repository.dart';
import 'package:echo/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class FullScreenChatScreen extends StatefulWidget {
  FullScreenChatScreen(
      {required this.uid,
      required this.receiverUid,
      required this.token,
      required this.name,
      super.key});
  String uid;
  String receiverUid;
  String token;
  String name;
  @override
  State<FullScreenChatScreen> createState() => _FullScreenChatScreenState();
}

class _FullScreenChatScreenState extends State<FullScreenChatScreen> {
  final messageController = TextEditingController();
  List messageList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Center(
          child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.8,
            child: ListView.builder(
              itemCount: messageList.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: widget.uid == messageList[index]["userId"]
                      ? Alignment.bottomLeft
                      : Alignment.bottomRight,
                  child: Container(
                    // width: MediaQuery.sizeOf(context).width * 0.4,
                    height: 50,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: widget.uid == messageList[index]["userId"]
                            ? primaryColor
                            : Colors.blue,
                        borderRadius: BorderRadius.circular(30)),
                    child: Text("${messageList[index]['message']}",
                        style: TextStyle(fontSize: 24)),
                  ),
                );
              },
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.send),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                onSubmitted: (value) async {
                  if (messageController.text.isNotEmpty) {
                    final roomId = await ChatRepository().sendMessage(
                        widget.uid,
                        widget.receiverUid,
                        widget.token,
                        messageController.text);
                    print(roomId);

                    final messages = await ChatRepository().getMessage(
                      roomId: roomId,
                      token: widget.token,
                    );
                    messageList = messages;
                    print(messageList[0]["message"]);
                    messageController.clear();
                    setState(() {});
                  }
                },
              ),
            ),
          ))
        ],
      )),
    );
  }
}
