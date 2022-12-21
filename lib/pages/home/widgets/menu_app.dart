// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nubank_home/pages/home/widgets/item_menu.dart';

class MenuApp extends StatelessWidget {
  final double top;
  final bool showMenu;

  const MenuApp({super.key, required this.top, required this.showMenu});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        opacity: showMenu ? 1 : 0,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.65,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(children: [
              Image.network(
                'https://webmobtuts.com/wp-content/uploads/2019/02/QR_code_for_mobile_English_Wikipedia.svg_.png',
                height: 120,
                color: Colors.white,
              ),
              //Para poder formatar de formas diferentes partes do texto
              const Text.rich(
                TextSpan(
                    text: 'Banco ',
                    children: [
                      TextSpan(
                          text: '260 - Nu Pagamentos S.A',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                    style: TextStyle(fontSize: 12)),
              ),

              const SizedBox(height: 8),

              const Text.rich(
                TextSpan(
                    text: 'Agencia ',
                    children: [
                      TextSpan(
                          text: '0001',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                    style: TextStyle(fontSize: 12)),
              ),

              const SizedBox(height: 8),

              const Text.rich(
                TextSpan(
                    text: 'Conta ',
                    children: [
                      TextSpan(
                          text: '000000-0',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                    style: TextStyle(fontSize: 12)),
              ),

              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    ItemMenu(
                      icon: Icons.info_outline,
                      text: 'Me ajuda',
                    ),
                    ItemMenu(
                      icon: Icons.person_outline,
                      text: 'Perfil',
                    ),
                    ItemMenu(
                      icon: Icons.settings,
                      text: 'Configurar conta',
                    ),
                    ItemMenu(
                      icon: Icons.credit_card,
                      text: 'Configurar cartão',
                    ),
                    ItemMenu(
                      icon: Icons.store_mall_directory,
                      text: 'Pedir conta PJ',
                    ),
                    ItemMenu(
                      icon: Icons.phone_android,
                      text: 'Configurações',
                    ),
                    const SizedBox(height: 15),
                    Container(
                      height: 35,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: 0.7,
                        color: Colors.white54,
                      )),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple[800], elevation: 0),
                        child: Text(
                          'SAIR DO APP',
                          style: TextStyle(fontSize: 10),
                        ),
                        //É obrigatorio passar a função, mesmo que nn use
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
