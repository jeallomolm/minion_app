import 'package:flutter/cupertino.dart';
import 'package:flutter_app/data/data.dart';
import 'package:flutter_app/widgets/widgets.dart';

final PageController controller = PageController(initialPage: 0);
List<Widget> cards = [];

class CharView extends StatelessWidget {
  final VoidCallback openContainer;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: cards,
    );
  }

  CharView(this.openContainer) {
    if (cards.isEmpty) {
      buildCards(openContainer);
    }
  }

  void buildCards(VoidCallback open) {
    int i = 0;
    for (i = 0; i < characters.length; i++) {
      cards.add(CharacterCard(open, characters[i]));
    }
  }
}
