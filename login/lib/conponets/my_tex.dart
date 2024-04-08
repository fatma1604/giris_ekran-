import 'package:flutter/material.dart';
import 'package:login/conponets/nebox.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Icon prefixIcon;
  final IconButton? suffixIcon;
  final String hintText;
  final bool? obscureText;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? autocorrect;

  const MyTextField({
    Key? key,
    this.controller,
    required this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    this.obscureText,
    this.onSaved,
    this.validator,
    this.keyboardType,
    this.autocorrect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return NeuBox(
      width: mediaQuery.width * 0.8,
      height: mediaQuery.height * 0.08,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          autocorrect: autocorrect ?? false,
          keyboardType: keyboardType,
          onSaved: onSaved,
          validator: validator,
          controller: controller,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(30.0)), // Oval kenarlığı tanımla
              borderSide: BorderSide(
                color: Color.fromARGB(255, 250, 248, 248),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(30.0)), // Oval kenarlığı tanımla
              borderSide: BorderSide(color: Color.fromARGB(255, 236, 234, 234)),
            ),
            filled: true,
            fillColor: Color.fromARGB(164, 247, 211, 211),
            hintText: hintText,
            hintStyle:
                const TextStyle(color: Color.fromARGB(255, 233, 230, 230)),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
