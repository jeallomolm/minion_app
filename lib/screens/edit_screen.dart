import 'package:flutter/material.dart';
import 'package:flutter_app/config/config.dart';
import 'package:flutter_app/models/character_model.dart';
import 'package:flutter_app/widgets/widgets.dart';

class EditScreen extends StatelessWidget {
  final VoidCallback closeContainer;
  final Character char;

  EditScreen(this.closeContainer, this.char);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BG.bgDecoration(char.color),
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            child: Button(Icons.send, () {}, 20.0),
          ),
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            leading: Button(Icons.close, closeContainer, 30.0),
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
                    children: [
                      Container(
                        height: 40.0,
                        margin: EdgeInsets.only(
                            left: MARGIN * 2,
                            right: MARGIN * 2,
                            top: MARGIN * 1.5,
                            bottom: MARGIN * 0.3),
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                          cursorHeight: null,
                          obscureText: false,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              hintText: "Nuevo nombre",
                              fillColor: Colors.white,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        ),
                      ),
                      Container(
                        height: 120.0,
                        margin: EdgeInsets.symmetric(horizontal: MARGIN * 2),
                        child: TextField(
                          maxLines: 50,
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                          cursorHeight: null,
                          obscureText: false,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              hintText: "Nueva descripcion",
                              fillColor: Colors.white,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
