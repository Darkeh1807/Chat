import 'package:chat_box/resources/colors.dart';
import 'package:flutter/material.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile(
      {Key? key,
      required this.avatarimg,
      required this.chatname,
      required this.recentmessage,
      required this.numberofmessages,
      required this.timestamp})
      : super(key: key);
  final String avatarimg;
  final String chatname;
  final String recentmessage;
  final String numberofmessages;
  final String timestamp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0.3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            contentPadding: const EdgeInsets.all(4),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(avatarimg),
              radius: 32,
            ),
            title: Text(
              chatname,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(recentmessage),
            ),
            trailing: Column(
              children: [
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      color: orangeColor,
                      borderRadius: BorderRadius.circular(250)),
                  child: Center(
                    child: Text(
                      numberofmessages,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(timestamp),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
