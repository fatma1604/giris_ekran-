import 'package:flutter/material.dart';

class OnButton extends StatelessWidget {
  const OnButton({
    Key? key,
    required this.onPressed,
    required this.primaryColor,
    required this.onPrimaryColor,
    required this.elevation,
    required this.padding,
    required this.text,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Color primaryColor;
  final Color onPrimaryColor;
  final double elevation;
  final EdgeInsetsGeometry padding;
  final String text;

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
       
        elevation: elevation,
        padding: padding,
      ),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildElevatedButton();
  }
}
