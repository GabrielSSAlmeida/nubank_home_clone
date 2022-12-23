import 'package:flutter/material.dart';

class CardApp extends StatelessWidget {
  final Widget child;

  const CardApp({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      //Um espaçamento para o Container
      padding: const EdgeInsets.all(20),
      //Mesmo espaço para todos os lados
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: child,
      ),
    );
  }
}
