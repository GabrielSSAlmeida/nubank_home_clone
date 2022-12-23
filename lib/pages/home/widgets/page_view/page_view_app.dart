import 'package:flutter/material.dart';

import '../cards/card_app.dart';
import '../cards/first_card.dart';
import '../cards/second_cart.dart';
import '../cards/third_card.dart';

class PageViewApp extends StatefulWidget {
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
  State<PageViewApp> createState() => _PageViewAppState();
}

class _PageViewAppState extends State<PageViewApp> {
  late Tween<double> _tween = Tween<double>(begin: 80.0, end: 80.0);

  @override
  void initState() {
    super.initState();
    _tween = Tween<double>(begin: 150.0, end: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    //Fazer nimações costumizadas
    return TweenAnimationBuilder<double>(
        tween: _tween,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutExpo,
        builder: (context, value, child) {
          return AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            top: widget.top,
            height: MediaQuery.of(context).size.height * 0.55,
            left: value,
            right: value * -1,
            child: GestureDetector(
              onPanUpdate: widget.onPanUpdate,
              child: PageView(
                //Toda vez que mudar a pagina ela coloca o index da pagina na variavel
                onPageChanged: widget.onChanged,
                physics: widget.showMenu
                    ? const NeverScrollableScrollPhysics()
                    : const BouncingScrollPhysics(),
                children: const [
                  CardApp(
                    child: FirstCard(),
                  ),
                  CardApp(
                    child: SecondCard(),
                  ),
                  CardApp(
                    child: ThirdCard(),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
