import 'package:flutter/material.dart';

class MessageForm extends StatelessWidget {
  const MessageForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 65,
      width: double.infinity,


      child: Row(
        children:const [TextField()],
      ),
    );
  }
}
