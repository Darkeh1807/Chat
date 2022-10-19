import 'package:chat_box/resources/user_list.dart';
import 'package:chat_box/widgets/custom_chat_listview.dart';
import 'package:flutter/material.dart';

class SchoolScreen extends StatelessWidget {
  const SchoolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: schoolUsers.length,
      itemBuilder: (context, index) {
      
      return ChatListTile(
          avatarimg: schoolUsers[index]['avatarimg'],
          chatname: schoolUsers[index]['chatname'],
          recentmessage: schoolUsers[index]['recentmessage'],
          numberofmessages: schoolUsers[index]['numberofmessages'],
          timestamp: schoolUsers[index]['timestamp']);
    });
  }
}
