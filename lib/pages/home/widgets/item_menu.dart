import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ItemMenu extends StatelessWidget {
  final IconData icon;
  final String text;

  const ItemMenu({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        backgroundColor: Colors.purple[800], elevation: 0);

    return Container(
      height: 40,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.7, color: Colors.white),
          top: BorderSide(width: 0.7, color: Colors.white),
        ),
      ),
      //Um botao com um visual "Elevado"
      child: ElevatedButton(
        style: style,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon),
                const SizedBox(width: 15),
                Text(
                  text,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            const Icon(
              Icons.chevron_right,
              size: 16,
            )
          ],
        ),
        //É obrigatorio passar a função, mesmo que nn use
        onPressed: () {},
      ),
    );
  }
}
