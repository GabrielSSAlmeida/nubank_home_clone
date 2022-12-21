import 'package:flutter/material.dart';
import 'package:nubank_home/pages/home/widgets/first_card.dart';

import 'card_app.dart';

class PageViewApp extends StatelessWidget {
  const PageViewApp(
      {super.key,
      required this.top,
      required this.onChanged,
      required this.onPanUpdate,
      required this.showMenu});

  final bool showMenu;
  final double top;
  //É um tipo de variavel que informa que um valor foi alterado(Usado em callbacks)
  final ValueChanged<int> onChanged;

  final GestureDragUpdateCallback onPanUpdate;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      top: top,
      height: MediaQuery.of(context).size.height * 0.55,
      left: 0,
      right: 0,
      child: GestureDetector(
        onPanUpdate: onPanUpdate,
        child: PageView(
          //Toda vez que mudar a pagina ela coloca o index da pagina na variavel
          onPageChanged: onChanged,
          physics: showMenu
              ? const NeverScrollableScrollPhysics()
              : const BouncingScrollPhysics(),
          children: [
            CardApp(
              child: FirstCard(),
            ),
            //CardApp(),
            //CardApp(),
          ],
        ),
      ),
    );
  }
}
