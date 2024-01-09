import 'package:echo/repository/post_repository.dart';
import 'package:echo/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String? uid;
  String? token;
  dynamic notifications;
  fetchNotification() async {
    uid = (await SharedPref().getUid())!;
    token = (await SharedPref().getRefreshToken())!;
    final response = await PostRepository().getNotifications(uid!, token!);
    notifications = response;
    print("-----------------------------------------------------------");
    print(notifications['like']);

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: notifications != null ? notifications['like'].length : 0,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(15),
              child: notifications != null
                  ? Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              "${notifications['like'][index]['profileImage']}"),
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text:
                                  "${notifications['like'][index]['username']} ",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.black)),
                          TextSpan(
                              text: " like your post ",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black.withOpacity(0.6))),
                          TextSpan(
                              text:
                                  "at${notifications['like'][index]['createdAt'].substring(0, 10)}",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
                        ]))
                      ],
                    )
                  : SizedBox(),
            );
          },
        ),
      ),
    );
  }
}
