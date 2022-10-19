import 'package:chat_box/resources/colors.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, required this.avatarimg, required this.chatname})
      : super(key: key);
  final String avatarimg;
  final String chatname;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Future showWarning() async {
    Future.delayed(const Duration(hours: 1), () {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Container(
            padding: const EdgeInsets.all(16),
            height: 180,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.red,
            ),
            child: Column()),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        duration: const Duration(seconds: 5),
        elevation: 0,
      ));
    });
  }

  @override
  void initState() {
    //
    super.initState();
    showWarning();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: orangeColor,
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: orangeColor,
            child: Center(
              child: Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(widget.avatarimg),
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                  Text(
                    widget.chatname,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    width: 120,
                  ),
                  const IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.video_call,
                        color: Colors.white,
                        size: 35,
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  const IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.call,
                        color: Colors.white,
                        size: 30,
                      ))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 45),
            child: Text(
              textAlign: TextAlign.center,
              'Today',
              style: TextStyle(fontSize: 15),
            ),
          ),
          const Expanded(child: DemoMessageList()),
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              color: lightGrey,
              child: TextField(
                decoration: InputDecoration(
                    suffix: TextButton(
                      onPressed: null,
                      style: TextButton.styleFrom(),
                      child: const Text("Send"),
                    ),
                    hintText: "Message",
                    prefix: const IconButton(
                      onPressed: null,
                      icon: Icon(Icons.emoji_emotions),
                    ),
                    border: InputBorder.none),
              )),
        ],
      ),
    );
  }
}

class RecievedMessageCard extends StatelessWidget {
  const RecievedMessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: const BoxDecoration(
            color: orangeColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: const Center(
            child: Text('Hey whats up'),
          ),
        ),
      ),
    );
  }
}

class SendMessageCard extends StatelessWidget {
  const SendMessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: const BoxDecoration(
            color: lightGrey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: const Center(
            child: Text('Hey whats up'),
          ),
        ),
      ),
    );
  }
}

class DemoMessageList extends StatelessWidget {
  const DemoMessageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SendMessageCard(),
        RecievedMessageCard(),
        SendMessageCard(),
        RecievedMessageCard(),
        SendMessageCard(),
        RecievedMessageCard()
      ],
    );
  }
}
