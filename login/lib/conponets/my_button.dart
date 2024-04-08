import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onTap;

  const MyButton({
    Key? key,
    required this.buttonText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 247, 95, 95),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(169, 19, 4, 3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 2), // Gölgelendirme yönü ve mesafesi
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 15.0,
        ), // İhtiyaca göre padding ayarlayın
        child: ClipRRect(
          child: Container(
            width: 250,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                )),
            padding: const EdgeInsets.all(
                8.0), // İç konteynerin iç boşluğunu ayarlayın
            child: Center(
              child: Text(
                buttonText, // widget'tan buttonText'ı kullanın
                style: const TextStyle(
                  color: Color.fromARGB(255, 247, 178, 178),
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
