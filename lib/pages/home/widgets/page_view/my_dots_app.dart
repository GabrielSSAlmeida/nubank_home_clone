import 'package:flutter/material.dart';

class MyDotsApp extends StatelessWidget {
  const MyDotsApp(
      {super.key,
      required this.currentIndex,
      required this.top,
      required this.showMenu});

  final bool showMenu;
  final int currentIndex;
  final double top;

  Color getColor(int index) {
    return index == currentIndex ? Colors.white : Colors.white38;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      //Posicionar os itens de uma stack
      top: top,
      //Faz uma animação de opacidade - deixar visivel ou nn
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: showMenu ? 0 : 1,
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 7,
              width: 7,
              decoration: BoxDecoration(
                color: getColor(0),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 7,
              width: 7,
              decoration: BoxDecoration(
                color: getColor(1),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 7,
              width: 7,
              decoration: BoxDecoration(
                color: getColor(2),
                shape: BoxShape.circle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
