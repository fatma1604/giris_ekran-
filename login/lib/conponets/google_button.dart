import 'package:flutter/material.dart';
import 'package:login/login/loginfrom.dart';

class GoogleSignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        signInWithGoogle(context);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            Colors.transparent), // Arka plan rengini beyaz yapar
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/google.png',
            height: 50.0,
          ),
        ],
      ),
    );
  }
}
