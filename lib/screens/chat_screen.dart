import 'package:chat_box/resources/colors.dart';
import 'package:flutter/cupertino.dart';
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
  final messageController = TextEditingController();

  late String _message;
  void _onPressed() {
    print(_message);
  }

  Future showWarning() async {
    Future.delayed(
      const Duration(seconds: 20),
      () {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Column(
              children: const [
                Text(
                  "You've spent more than five hours chatting today !!!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            content: Column(
              children: [
                const Text(
                  "😒",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 75),
                ),
                const SizedBox(
                  height: 5 + 75,
                ),
                TextButton(
                  onPressed: null,
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.orangeColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 75, right: 75),
                    child: Text('Play a game'),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: null,
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.orangeColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 75, right: 75),
                    child: Text('Read a book'),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: null,
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.orangeColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 75, right: 75),
                    child: Text('List to music'),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Close',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        );
      },
    );
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
      backgroundColor: const Color(0xfff6f6f6),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios)),
        elevation: 0,
        backgroundColor: AppColors.orangeColor,
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: AppColors.orangeColor,
            child: Center(
              child: Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                    radius: 36,
                    backgroundImage: NetworkImage(widget.avatarimg),
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        Text(
                          widget.chatname,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        const Text(
                          "Online",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
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
            padding: EdgeInsets.only(top: 5, bottom: 15),
            child: Text(
              textAlign: TextAlign.center,
              'Today',
              style: TextStyle(fontSize: 15),
            ),
          ),
          const Expanded(child: DemoMessageList()),
          Row(
            children: [
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35)),
                  color: const Color.fromARGB(172, 246, 246, 246),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      maxLines: 10,
                      minLines: 1,
                      onChanged: (value) {
                        _message = value;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Message',
                          border: InputBorder.none,
                          fillColor: AppColors.lightGrey,
                          prefixIcon: Icon(
                            Icons.emoji_emotions,
                            size: 25 + 5,
                            color: AppColors.orangeColor,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              CupertinoIcons.camera_fill,
                              size: 25 + 5,
                              color: AppColors.orangeColor,
                            ),
                            onPressed: null,
                          )),
                    ),
                  ),
                ),
              ),
              Container(
                height: 25 * 2,
                width: 25 * 2,
                decoration: BoxDecoration(
                    color: AppColors.orangeColor,
                    borderRadius: BorderRadius.circular(250)),
                child: IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                     
                     
                    size: 25,

                  ),
                  onPressed: _onPressed,
                ),
              )
            ],
          )
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
            color: AppColors.orangeColor,
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

class SendMessageCard extends StatefulWidget {
  const SendMessageCard({super.key});

  @override
  State<SendMessageCard> createState() => _SendMessageCardState();
}

class _SendMessageCardState extends State<SendMessageCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        showTimePicker(context: context, initialTime: TimeOfDay.now());
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: const BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: const Center(
              child: Text('Hey how are you'),
            ),
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
        RecievedMessageCard(),
        SendMessageCard(),
        RecievedMessageCard(),
        SendMessageCard(),
        RecievedMessageCard(),
        SendMessageCard(),
        RecievedMessageCard(),
        SendMessageCard(),
        RecievedMessageCard(),
        SendMessageCard(),
        RecievedMessageCard(),
        SendMessageCard(),
        RecievedMessageCard(),
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

class SendMessageField extends StatelessWidget {
  const SendMessageField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: const [
        TextField(
          minLines: 2,
          maxLines: 10,
          decoration: InputDecoration(
            prefixIcon: Icon(CupertinoIcons.list_bullet),
          ),
        ),
        IconButton(onPressed: null, icon: Icon(CupertinoIcons.camera)),
        IconButton(onPressed: null, icon: Icon(Icons.mic))
      ],
    ));
  }
}
