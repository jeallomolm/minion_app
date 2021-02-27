import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter_app/config/config.dart';
import 'package:flutter_app/screens/animation_screen_edit.dart';
import 'package:flutter_app/screens/screens.dart';
import 'package:flutter_app/models/models.dart';

class AnimationScreen extends StatefulWidget {
  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: Duration(seconds: 1),
      tappable: false,
      openBuilder: (_, closeContainer()) =>
          AnimationScreenEdit(closeContainer, CHAR),
      closedBuilder: (_, openContainer()) => HomeScreen(openContainer),
    );
  }
}
