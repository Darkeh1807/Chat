import 'package:chat_box/resources/user_list.dart';
import 'package:chat_box/screens/chat_screen.dart';
import 'package:chat_box/widgets/custom_chat_listview.dart';
import 'package:flutter/material.dart';

class WorkScreen extends StatelessWidget {
  const WorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: workUsers.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 800),
                      transitionsBuilder:
                          (context, animation, animationTime, child) {
                        animation = CurvedAnimation(
                            parent: animation, curve: Curves.easeOutBack);
                        return ScaleTransition(
                          scale: animation,
                          alignment: Alignment.center,
                          child: child,
                        );
                      },
                      pageBuilder: (context, animation, animationTime) {
                        return ChatScreen(
                            avatarimg: workUsers[index]['avatarimg'],
                            chatname: workUsers[index]['chatname']);
                      }));
            },
            child: ChatListTile(
                avatarimg: workUsers[index]['avatarimg'],
                chatname: workUsers[index]['chatname'],
                recentmessage: workUsers[index]['recentmessage'],
                numberofmessages: workUsers[index]['numberofmessages'],
                timestamp: workUsers[index]['timestamp']),
          );
        });
  }
}
