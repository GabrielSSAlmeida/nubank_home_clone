import 'package:flutter/material.dart';

class MyDotsApp extends StatelessWidget {
  const MyDotsApp({super.key, required this.currentIndex});

  final int currentIndex;

  Color getColor(int index) {
    return index == currentIndex ? Colors.white : Colors.white38;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
