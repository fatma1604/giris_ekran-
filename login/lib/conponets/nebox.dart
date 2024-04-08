import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;

  const NeuBox({Key? key, this.child, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Adjust based on desired shadow direction

    return Container(
      constraints: BoxConstraints(
        minHeight: height ?? 50,
        maxWidth: width ?? 50,
      ),
      decoration: BoxDecoration(
        color: Color.fromARGB(146, 247, 95, 95),
        borderRadius: BorderRadius.circular(20), // Reduced border radius to 8
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
