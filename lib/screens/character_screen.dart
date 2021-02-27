import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/screens/edit_screen.dart';
import 'package:flutter_app/widgets/widgets.dart';
import 'package:flutter_app/config/config.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CharacterScreen extends StatelessWidget {
  final VoidCallback openContainer;
  final VoidCallback closeContainer;
  final Character char;

  CharacterScreen(this.closeContainer, this.char, this.openContainer);

  Card img(Character char, int n, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
              "images/" +
                  char.name.toLowerCase() +
                  "Clips/clip" +
                  n.toString() +
                  ".png",
              width: MediaQuery.of(context).size.width * 0.40)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      minHeight: 70.0,
      maxHeight: MediaQuery.of(context).size.width * 1.2,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(MARGIN * 1.5),
          topRight: Radius.circular(MARGIN * 1.5)),
      panel: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: MARGIN, top: MARGIN * 0.5, bottom: MARGIN * 0.5),
              child: Text(
                "Clips (" + char.clips.toString() + ")",
                style: TxtStyle.panelClips,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [img(char, 1, context), img(char, 2, context)],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                  Row(
                    children: [img(char, 3, context), img(char, 4, context)],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: Container(
        decoration: BG.bgDecoration(char.color),
        child: SafeArea(
          child: Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              leading: Button(Icons.close, closeContainer, 30.0),
              actions: [
                Button(Icons.edit, openContainer, 30.0),
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: MARGIN, top: MARGIN),
                      child: Image.asset(
                          'images/' + char.name.toLowerCase() + '.png',
                          width: MediaQuery.of(context).size.width * 0.60),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: MARGIN),
                          child: Text(
                            char.name,
                            style: TxtStyle.name,
                          ),
                        ),
                        SizedBox(width: double.infinity, height: MARGIN),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: MARGIN),
                          child: Text(
                            char.info,
                            style: TxtStyle.text,
                          ),
                        ),
                        SizedBox(width: double.infinity, height: MARGIN * 3),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
