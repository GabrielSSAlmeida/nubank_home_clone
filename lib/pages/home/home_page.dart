import 'package:flutter/material.dart';
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
          )
        ],
      ), //Pilha - pega uma lista de widgets e os renderiza um em cima do outro
    );
  }
}
