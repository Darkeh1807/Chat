import 'package:chat_box/resources/colors.dart';
import 'package:chat_box/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SignInUsingPhone extends StatelessWidget {
  const SignInUsingPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            const Text(
              'Log in to your account',
              style: TextStyle(fontSize: 20, color: orangeColor),
            ),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                color: background,
                child: TextFormField(
                  decoration: const InputDecoration(
                      label: FlutterLogo(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)))),
                ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Container(
            height: 300,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: lightGrey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(130),
                    topRight: Radius.circular(130))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    },
                    // ignore: sort_child_properties_last
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, top: 10, bottom: 10),
                      child: Text(
                        'Sign in with phone number',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: deepGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35))),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Dont have an account?"),
                    Text(
                      "Sign up",
                      style: TextStyle(
                          color: orangeColor, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
