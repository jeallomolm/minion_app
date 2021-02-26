import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/config/config.dart';
import 'package:flutter_app/models/models.dart';

class CharacterCard extends StatelessWidget {
  final VoidCallback openContainer;
  final Character char;

  CharacterCard(this.openContainer, this.char);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openContainer();
        CHAR = this.char;
      },
      child: Stack(children: [
        Container(
          margin: EdgeInsets.all(MARGIN),
          child: ClipPath(
            child: Container(decoration: BG.bgDecoration(char.color)),
            clipper: forma(),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(width: double.infinity),
            Container(
              margin: EdgeInsets.only(right: MARGIN * 1.5),
              child: Image.asset('images/' + char.name.toLowerCase() + '.png',
                  width: MediaQuery.of(context).size.width * 0.65),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(MARGIN * 2, 0.0, 0.0, MARGIN * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(char.name, style: TxtStyle.name),
                    SizedBox(width: double.infinity, height: 10.0),
                    Text(
                      "Click to Read more",
                      style: TxtStyle.text,
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}

class forma extends CustomClipper<Path> {
  final double radio = 40.0;
  final double dif = 60.0;
  final marginTop = 100.0;

  @override
  Path getClip(Size size) {
    double punto = sin(45) * radio;

    Path path = Path();
    path.moveTo(0, size.height - radio);
    path.quadraticBezierTo(
        radio - punto, size.height - radio + punto, radio, size.height);
    path.lineTo(size.width - radio, size.height);
    path.quadraticBezierTo(size.width - radio + punto,
        size.height - radio + punto, size.width, size.height - radio);
    path.lineTo(size.width, radio + marginTop);
    path.quadraticBezierTo(size.width - radio + punto,
        radio - punto + marginTop, size.width - radio, marginTop);
    path.quadraticBezierTo(
        size.width - radio + (sin(45 / 2) * radio),
        radio + (sin((45 / 2) * 3) * radio) + marginTop,
        size.width - radio - punto,
        radio - punto + marginTop);
    path.lineTo(radio, dif + marginTop);
    path.quadraticBezierTo(radio - punto, dif + radio - punto + marginTop, 0,
        dif + punto + marginTop);
    path.lineTo(0, size.height - punto);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
