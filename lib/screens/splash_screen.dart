import 'package:chat_box/resources/colors.dart';
import 'package:chat_box/screens/signin_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 200),
            child: Text(
              'Welcome to the',
              style: TextStyle(
                fontSize: 20,
                color: orangeColor,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'ChatBox',
            style: TextStyle(
                fontSize: 35, color: orangeColor, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          FlutterLogo(
            size: 95,
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Container(
          height: 300,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: lightGrey,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(130),
                  topRight: Radius.circular(130))),
          child: Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignIn()));
              },
              // ignore: sort_child_properties_last
              child: const Padding(
                padding:
                    EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
                child: Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: orangeColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35))),
            ),
          ),
        ),
      )
    ]));
  }
}
