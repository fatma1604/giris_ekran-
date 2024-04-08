import 'package:flutter/material.dart';
import 'package:login/forget/forget.dart';


class ForgetPage extends StatelessWidget {
  const ForgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/tasarım (6).gif"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            child: Transform.translate(
              offset: const Offset(0, 90), // Adjust the value as needed
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Forget(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
