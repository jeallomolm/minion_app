import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/character_model.dart';
import 'package:flutter_app/screens/character_screen.dart';
import 'package:flutter_app/screens/edit_screen.dart';

class AnimationScreenEdit extends StatefulWidget {
  final VoidCallback closeContainer;
  final Character char;

  AnimationScreenEdit(this.closeContainer, this.char);

  @override
  _AnimationScreenEditState createState() =>
      _AnimationScreenEditState(closeContainer, char);
}

class _AnimationScreenEditState extends State<AnimationScreenEdit> {
  VoidCallback closeContainer;
  Character char;

  _AnimationScreenEditState(this.closeContainer, this.char);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: Duration(seconds: 1),
      tappable: false,
      openBuilder: (_, closeContainer()) => EditScreen(closeContainer, char),
      closedBuilder: (_, openContainer()) =>
          CharacterScreen(closeContainer, char, openContainer),
    );
  }
}
