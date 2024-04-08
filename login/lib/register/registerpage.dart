import 'package:flutter/material.dart';
import 'package:login/register/register_from.dart';


class Register extends StatelessWidget {
  Register({Key? key, this.onTap}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final void Function()? onTap;

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
                    child: RegisterPage(
                      onTap: () {},
                    ),
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
