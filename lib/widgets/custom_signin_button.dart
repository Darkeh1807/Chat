import 'package:chat_box/resources/colors.dart';
import 'package:flutter/material.dart';

class CustomSignInButton extends StatelessWidget {
  const CustomSignInButton(
      {super.key, required this.optionimg, required this.optiontext});

  final String optionimg;
  final String optiontext;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 55, right: 55),
      child: TextButton(
          onPressed: null,
          style: TextButton.styleFrom(
              backgroundColor: AppColors.orangeColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25))),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                const FlutterLogo(),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  optiontext,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                )
              ],
            ),
          )),
    );
  }
}
