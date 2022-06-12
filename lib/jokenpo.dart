import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Joken extends StatefulWidget {
  @override
  //stado inicial
  _JokenState createState() => _JokenState();
}

//criando classe so jokenpô
class _JokenState extends State<Joken> {
  //variáveis
  //imagem do aplicativo
  var _imageApp = AssetImage(
    "assets/images/inter.jpeg",
  );

  //mensagem pra escolher uma opção
  var _mesage = "Escolha uma opção";
  //contador de vitorias do usuario
  var _userWin = 0;
  //contador de vitorias do computador
  var _computerWin = 0;
  //contador de empates
  var _draw = 0;

  void _selectedOption(String userChoice) {
    //função para randomizar a jogada do computador
    var options = ["pedra", "papel", "tesoura"];
    var number = Random().nextInt(3);
    var choseApp = options[number];

    //Aqui irá exibir a imagem que o Computador escolheu
    switch (choseApp) {
      case "pedra":
        setState(() {
          this._imageApp = AssetImage('assets/images/pedra.jpeg');
        });
        break;

      case "papel":
        setState(() {
          this._imageApp = AssetImage('assets/images/papel.jpeg');
        });
        break;

      case "tesoura":
        setState(() {
          this._imageApp = AssetImage("assets/images/tesoura.jpeg");
        });
        break;
      default:
        setState(() {
          this._imageApp = AssetImage("assets/images/inter.jpeg");
        });
    }
    // Aqui será validado os casos de Jogadas do ganhador
    if ((userChoice == "pedra" && choseApp == "tesoura") ||
        (userChoice == "tesoura" && choseApp == "papel") ||
        (userChoice == "papel" && choseApp == "pedra")) {
      setState(() {
        this._mesage = "Você ganhou :D";
        _userWin += 1;
      });
    } else if ((userChoice == "tesoura" && choseApp == "pedra") ||
        (userChoice == "papel" && choseApp == "tesoura") ||
        (userChoice == "pedra" && choseApp == "papel")) {
      setState(() {
        this._mesage = "Vitoria do computador";
        _computerWin += 1;
      });
    } else {
      setState(() {
        this._mesage = "Empate ;)";
        _draw += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text("Escolha do Comutador",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Image(image: this._imageApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(this._mesage,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _selectedOption("pedra"),
                child: Image.asset('assets/images/pedra.jpeg', height: 100),
              ),
              GestureDetector(
                onTap: () => _selectedOption("papel"),
                child: Image.asset(
                  'assets/images/papel.jpeg',
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _selectedOption("tesoura"),
                child: Image.asset('assets/images/tesoura.jpeg', height: 100),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 32),
                child: Text(
                  "Você: $_userWin",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  "Computador: $_computerWin",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  "Empate: $_draw",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
