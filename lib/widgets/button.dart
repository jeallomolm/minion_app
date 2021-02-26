import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double iconSize;

  Button(this.icon, this.onPressed, this.iconSize);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      color: Colors.black,
      iconSize: iconSize,
      onPressed: onPressed,
    );
  }
}
