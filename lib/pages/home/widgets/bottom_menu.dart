import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'item_menu_bottom.dart';

class BottomMenu extends StatelessWidget {
  final bool showMenu;

  const BottomMenu({super.key, required this.showMenu});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      //Agora nn ocupa a parte dos botoes de navegação
      bottom: !showMenu ? 0 + MediaQuery.of(context).padding.bottom : 0,
      left: 0,
      right: 0,
      height: MediaQuery.of(context).size.height * 0.15,
      /* ignora todos os pointer-events, neste caso,
              irá ignorar o arrastar quando a PageView estiver em baixo
           */
      child: IgnorePointer(
        ignoring: showMenu,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: !showMenu ? 1 : 0,
          child: Container(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const ItemMenuBottom(
                  icon: Icons.person_add,
                  text: 'indicar amigos',
                ),
                const ItemMenuBottom(
                  icon: Icons.phone_android,
                  text: 'Recarga de celular',
                ),
                const ItemMenuBottom(
                  icon: Icons.chat,
                  text: 'Cobrar',
                ),
                const ItemMenuBottom(
                  icon: Icons.monetization_on,
                  text: 'Empréstimos',
                ),
                const ItemMenuBottom(
                  icon: Icons.move_to_inbox,
                  text: 'Depositar',
                ),
                const ItemMenuBottom(
                  icon: Icons.mobile_screen_share,
                  text: 'Transferir',
                ),
                const ItemMenuBottom(
                  icon: Icons.format_align_center,
                  text: 'Ajustar limite',
                ),
                const ItemMenuBottom(
                  icon: Icons.chrome_reader_mode,
                  text: 'Pagar',
                ),
                const ItemMenuBottom(
                  icon: Icons.lock_open,
                  text: 'Bloquar cartão',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
