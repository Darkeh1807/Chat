import 'package:chat_box/resources/colors.dart';
import 'package:chat_box/screens/signin_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future navigateToSignIn() async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const SignIn()));
    });
  }

  @override
  void initState() {
    super.initState();
    navigateToSignIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 200),
            child: Text(
              'Welcome to the',
              style: TextStyle(
                fontSize: 20,
                color: AppColors.orangeColor,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'ChatBox',
            style: TextStyle(
                fontSize: 35, color: AppColors.orangeColor, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "😂",
            style: TextStyle(fontSize: 75),
          ),
        ],
      ),
      Expanded(child: Container()),
      Container(
        height: 300,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(180), topRight: Radius.circular(180))),
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
                backgroundColor: AppColors.orangeColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35))),
          ),
        ),
      )
    ]));
  }
}
