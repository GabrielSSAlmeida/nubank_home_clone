import 'package:flutter/material.dart';

import 'card_app.dart';

class PageViewApp extends StatelessWidget {
  const PageViewApp({super.key, required this.top, required this.onChanged});

  final double top;
  final ValueChanged<int>
      onChanged; //É um tipo de variavel que informa que um valor foi alterado(Usado em callbacks)

  @override
  Widget build(BuildContext context) {
    return Positioned(
      //Posicionar os itens de uma stack
      top: top,
      height: MediaQuery.of(context).size.height * 0.55,
      left: 0,
      right: 0,
      child: PageView(
        onPageChanged:
            onChanged, //Toda vez que mudar a pagina ela coloca o index da pagina na variavel
        physics: const BouncingScrollPhysics(),
        children: [
          const CardApp(),
          const CardApp(),
          const CardApp(),
        ],
      ),
    );
  }
}
