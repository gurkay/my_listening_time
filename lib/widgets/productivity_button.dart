import 'package:flutter/material.dart';

class ProductivityButton extends StatelessWidget {
  final Color myColor;
  final String myText;
  final VoidCallback onPressed;
  final double mySize;

  ProductivityButton({
    required this.myColor,
    required this.myText,
    required this.onPressed,
    required this.mySize,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: myColor,
      child: Text(
        myText,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: onPressed,
      minWidth: (mySize != null) ? mySize : 0,
    );
  }
}
