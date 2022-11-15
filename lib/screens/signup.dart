import 'package:chat_box/resources/colors.dart';
import 'package:chat_box/screens/home_screen.dart';
import 'package:chat_box/widgets/custom_signin_button.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Column(
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 65),
              child: Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: 35,
                    color: AppColors.orangeColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            CustomSignInButton(
                optionimg: '', optiontext: 'Sign up with Facebook'),
            SizedBox(
              height: 20,
            ),
            CustomSignInButton(
                optionimg: '', optiontext: 'Sign up with Google'),
            SizedBox(
              height: 20,
            ),
            CustomSignInButton(optionimg: '', optiontext: 'Sign up with Apple')
          ],
        ),
        Expanded(child: Container()),
        Container(
          height: 300,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(180),
                  topRight: Radius.circular(180))),
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
                      'Continue to ChatBox',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor:AppColors.deepGrey,
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
                        color: AppColors.orangeColor, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
