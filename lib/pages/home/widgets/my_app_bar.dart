import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key, required this.showMenu, required this.onTap});
  final bool showMenu;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          //É um widget com tamanho especifico e seus filhos seguem esse tamanho (Pode colocar tamanho infinty)
          height: MediaQuery.of(context).padding.top,
          //StatusBar - É o tamanho da barra de itens do sistema(Barra do wifi)
        ),
        GestureDetector(
          //Detecta toques e outras interações do usuario com a tela
          onTap: onTap,
          child: Container(
            color: Colors.purple[800],
            height: MediaQuery.of(context).size.height *
                0.20, //Responsivo - Deixar a altura 0.20 vzs o tamanho da tela
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.network(
                    'https://logodownload.org/wp-content/uploads/2019/08/nubank-logo-3.png',
                    height: 35,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    //Espaçamento
                    width: 10,
                  ),
                  const Text(
                    'Gabriel',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ]),
                Icon(!showMenu ? Icons.expand_more : Icons.expand_less)
              ],
            ),
          ),
        )
      ],
    );
  }
}
