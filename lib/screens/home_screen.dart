import 'package:flutter/material.dart';
import 'package:flutter_app/config/config.dart';
import 'package:flutter_app/widgets/widgets.dart';

import '../widgets/button.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback openContainer;

  HomeScreen(this.openContainer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        actions: [Button(Icons.search, () => print("asd"), 30.0)],
        leading: Button(Icons.arrow_back_ios, () {}, 20.0),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Despicable Me", style: TxtStyle.title),
                Text(
                  "Characters",
                  style: TxtStyle.subTitle,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                width: double.infinity, child: CharView(openContainer)),
          )
        ],
      ),
    );
  }
}
