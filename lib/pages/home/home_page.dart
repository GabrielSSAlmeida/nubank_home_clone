import 'package:flutter/material.dart';
import 'package:nubank_home/pages/home/widgets/item_menu_bottom.dart';
import 'package:nubank_home/pages/home/widgets/menu_app.dart';
import 'package:nubank_home/pages/home/widgets/my_app_bar.dart';
import 'package:nubank_home/pages/home/widgets/my_dots_app.dart';
import 'package:nubank_home/pages/home/widgets/page_view_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showMenu = false;
  int _currentIndex = 0;
  double _yPosition = 0;

  @override
  void initState() {
    super.initState();
    _showMenu = false;
    _currentIndex = 0;
    double _yPosition = 0;
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeigth = MediaQuery.of(context).size.height;
    if (_yPosition == 0) {
      _yPosition = _screenHeigth * 0.20;
    }
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          MyAppBar(
            showMenu: _showMenu,
            onTap: () {
              setState(() {
                _showMenu = !_showMenu;
                _yPosition =
                    _showMenu ? _screenHeigth * 0.80 : _screenHeigth * 0.20;
              });
            },
          ),
          MenuApp(
            top: _screenHeigth * 0.18,
            showMenu: _showMenu,
          ),
          PageViewApp(
            showMenu: _showMenu,
            //Se tiver mostrando, desce se nao sobe
            top: _yPosition,
            onChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            //Detecta um segura e arrasta - details arma
            onPanUpdate: (details) {
              double positionBottomLimit = _screenHeigth * 0.80;
              double positionTopLimit = _screenHeigth * 0.20;
              double midlePostion =
                  (positionBottomLimit - positionTopLimit) / 2;
              setState(() {
                /* if (_yPosition >= positionTopLimit) {
                  //Altera a posição para a nova atualização de coordenadas
                  _yPosition += details.delta.dy;
                } else {
                  _yPosition = positionTopLimit;
                }

                if (_yPosition <= positionBottomLimit) {
                  _yPosition += details.delta.dy;
                } else {
                  _yPosition = positionBottomLimit;
                } */
                //Jeito do Video
                _yPosition += details.delta.dy;

                _yPosition = _yPosition < positionTopLimit
                    ? positionTopLimit
                    : _yPosition;

                _yPosition = _yPosition > positionBottomLimit
                    ? positionBottomLimit
                    : _yPosition;

                //Se a posição for diferente do limite infeior e estiver descendo
                if (_yPosition != positionBottomLimit && details.delta.dy > 0) {
                  //Se a posição for maior que a metade do caminho, vai direto pro fim.
                  _yPosition = _yPosition > positionTopLimit + midlePostion - 50
                      ? positionBottomLimit
                      : _yPosition;
                }

                if (_yPosition != positionTopLimit && details.delta.dy < 0) {
                  //Se a posição for menor que a metade do caminho, vai direto pro inicio.
                  _yPosition = _yPosition < positionBottomLimit - midlePostion
                      ? positionTopLimit
                      : _yPosition;
                }

                //Alterar a setinha
                if (_yPosition == positionBottomLimit) {
                  _showMenu = true;
                } else if (_yPosition == positionTopLimit) {
                  _showMenu = false;
                }
              });
            },
          ),
          MyDotsApp(
            showMenu: _showMenu,
            top: _screenHeigth * 0.74,
            currentIndex: _currentIndex,
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            //Agora nn ocupa a parte dos botoes de navegação
            bottom: !_showMenu ? 0 + MediaQuery.of(context).padding.bottom : 0,
            left: 0,
            right: 0,
            height: _screenHeigth * 0.15,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: !_showMenu ? 1 : 0,
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
        ],
      ), //Pilha - pega uma lista de widgets e os renderiza um em cima do outro
    );
  }
}
