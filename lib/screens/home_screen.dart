import 'package:chat_box/resources/colors.dart';
import 'package:chat_box/screens/personal_messages_screen.dart';
import 'package:chat_box/screens/school_messages_screen.dart';
import 'package:chat_box/screens/work_messages_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: orangeColor,
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(onPressed: null, icon: Icon(Icons.more_horiz))
            ],
            bottom: const TabBar(
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Text(
                  "Personal",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "Work",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "School",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          body: const TabBarView(
              children: [PersonalMessages(), WorkScreen(), SchoolScreen()]),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: const FloatingActionButton(
            onPressed: null,
            backgroundColor: orangeColor,
            child: Icon(Icons.add),
          ),
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        ));
  }
}
