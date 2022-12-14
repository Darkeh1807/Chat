import 'package:chat_box/resources/user_list.dart';
import 'package:chat_box/screens/chat_screen.dart';
import 'package:chat_box/widgets/custom_chat_listview.dart';
import 'package:flutter/material.dart';

class PersonalMessages extends StatelessWidget {
  const PersonalMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: personalUsers.length,
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
                              avatarimg: personalUsers[index]['avatarimg'],
                              chatname: personalUsers[index]['chatname']);
                        }));
              },
              child: ChatListTile(
                  avatarimg: personalUsers[index]['avatarimg'],
                  chatname: personalUsers[index]['chatname'],
                  recentmessage: personalUsers[index]['recentmessage'],
                  numberofmessages: personalUsers[index]['numberofmessages'],
                  timestamp: personalUsers[index]['timestamp']),
            );
          }),
    );
  }
}
