import 'package:chat_box/resources/colors.dart';
import 'package:chat_box/screens/signin_using_phone_number.dart';
import 'package:chat_box/widgets/custom_signin_button.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 65),
              child: Text(
                "Sign In",
                style: TextStyle(
                    fontSize: 35,
                    color: orangeColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            CustomSignInButton(
                optionimg: '', optiontext: 'Sign in with Facebook'),
            SizedBox(
              height: 20,
            ),
            CustomSignInButton(
                optionimg: '', optiontext: 'Sign in with Google'),
            SizedBox(
              height: 20,
            ),
            CustomSignInButton(optionimg: '', optiontext: 'Sign in with Apple')
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
                              builder: (context) => const SignInUsingPhone()));
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
