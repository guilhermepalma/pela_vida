//TODO Versão utilizada no dartpad, mas em constante ateração, com possiveis erros antigos.

import 'package:flutter/material.dart';
import 'dart:math';


//TODO main.dart
//TODO Arrumar as areas das Mensagens
//TODO Implementar um arquivo de aleatorização
//TODO Colocar uma função nos botões
//TODO Implementar a musica
//TODO Remover codigo comentados

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pela Vida',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) =>
      headerMain("Pela Vida", _body, lateralMenu, amarelo3, context);

  List<String> storagePhrase = [];
  String phraseDay = "", authorDay = "";
  String phrase = "", author = "";
  bool verificDay = false;

  _body() {
    //Programação
    //Verifica se a frase do dia ja existe usando uma variavel booleana
    if (verificDay == false) {
      storagePhrase = formatPhrase();
      phraseDay = storagePhrase[0];
      authorDay = storagePhrase[1];
      verificDay = true;
    }

    //Gera uma nova frase e atualiza na tela
    generationNewPhrase() {
      storagePhrase = formatPhrase();

      setState(() {
        phrase = storagePhrase[0];
        author = storagePhrase[1];
      });
    }

    //Layout
    return Container(
      color: Color(cinza2),
      height: double.infinity,
      width: double.infinity,
      //child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Container(//TODO ARRUMAR AMANHA PRA FICAR IGUAL O DE BAIXO
            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            width: 320,
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(5),
            ),
            child: _messages("Mensagem do Dia:", phraseDay, authorDay),
          ),




          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            width: 320,
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                  child: RaisedButton(
                      child: Text("Sortear Frase"),
                      onPressed: () {
                        generationNewPhrase();
                      }),
                ),
                _messages("Frases Sorteadas:", phrase, author),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            width: 320,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                  child: RaisedButton(
                      color: Color(cinza1),
                      child: Text(
                        "Sortear Frase",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      onPressed: () {
                        generationNewPhrase();
                      }),
                ),
                _messages("Frases Sorteadas:", phrase, author),
              ],
            ),
          ),

        ],
      ),
      //),
    );
  }
}

_messages(String _title, String _text1, String _text2) {
  return Card(
    color: Color(cinza3),
    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
    child: Container(
      width: 300,
      child: Column(
        children: <Widget>[
          Text(
            _title,
            style: TextStyle(
                fontSize: 20,
                color: Color(amarelo2),
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            _text1 == "" ? "" : '"$_text1"',
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              _text2 == "" ? "" : '-$_text2  ',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}







//------------------------------------------------------------------------//





//TODO page/style

//TODO colorsGlobal.dart
//Cores Usadas no app
int amarelo1 = 0xffFFED00 ;
int amarelo2 = 0xffFFDD00 ;
int amarelo3 = 0xffFDC300 ;
int amarelo4 = 0xffF8A800 ;

int cinza1 = 0xffD1D0D1 ;
int cinza2 = 0xffB0AEAA ;
int cinza3 = 0xff82807C ;
int cinza4 = 0xff3A3A3A ;

//*********************************************************************//

//TODO drawer.dart
//TODO Colocar as paginas corretas

lateralMenu(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[

        DrawerHeader(
          child: Text(
            'Pela vida',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          decoration: BoxDecoration(
            color: Color(cinza1),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                "assets/images/LogoPelaVida.png"
              ),
            ),
          ),
        ),
        _listaItens(0xeaac, "Perfil", Temporary(), context),
        _listaItens(0xe9c6, "Como Funciona", Temporary(), context),
        _listaItens(0xe7db, "Sobre o APP", Temporary(), context),
        _listaItens(60339, "Sobre Nós", Temporary(), context),
        _listaItens(0xe5fe, "Feedback", Temporary(), context),
        _listaItens(57520, "Configurações", Temporary(), context),
      ],
    ),
  );
}

//Codigo do Icone, Texto da Label, Pagina de Destino, context p/ navegação
_listaItens(int _icon, String _text, Widget _page, BuildContext context) {
  return ListTile(
    leading: Icon(IconData(_icon, fontFamily: 'MaterialIcons')),
    title: Text(_text),
    onTap: () {
      Navigator.of(context).pop();
      navegation(_page, context);
    },
  );
}

//*********************************************************************//

//TODO header.dart
//Titulo, Nome da função body, tela lateral, context p/ navegação entre as paginas
headerMain(String _title, Function _body, Function _drawer,int _color, BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Color(_color),
      title: Text(_title,
          style: TextStyle(fontSize: 23, color: Colors.white)),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () {},
        ),
      ],
    ),
    drawer: _drawer(context),
    body: _body(),
  );
}

//Titulo, Nome da função body, context p/ navegação p/ pagina principal
headerSecondary(String _title, Function _body, BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(_title, style: TextStyle(fontSize: 23, color: Colors.black)),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.home),
            onPressed: () => Navigator.of(context).pop()),
      ],
    ),
    body: _body(),
  );
}







//------------------------------------------------------------------------//





//TODO utils

//TODO navegation.dart
//Usado Para navegar entre as paginas
Future navegation(Widget _page, BuildContext context) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => _page)
  );
}

//*********************************************************************//

//TODO randomPhrases.dart

int _lengthPhrases = 5;
var _position = List<int>.generate(_lengthPhrases, (int index) => index++);

List<String> formatPhrase(){

  String _phrase, _author;
  List<String> finalAuthorPhrase;
  int valueIndex = valueRandom();

  List<String> listPhrase = [
      ("Oi0"),
      ("Oi1"),
      ("Oi2"),
      ("Oi3"),
      ("Oi4"),
  ];

  List<String> listAuthor = [
      ("T0"),
      ("T1"),
      ("T2"),
      ("T3"),
      ("T4"),
  ];


  if(valueIndex == 999){
    _phrase = 'Você já acessou todas as frases';
    finalAuthorPhrase = [
      _phrase,
      '',
    ];
    return finalAuthorPhrase;
  }

  //Pega a frase usando o valor do numero da lista
  _phrase = listPhrase[valueIndex];
  _author = listAuthor[valueIndex];

  finalAuthorPhrase = [
      _phrase,
      _author,
  ];

  return finalAuthorPhrase;

}


int valueRandom(){

  var random = new Random();
  int positionRandom, positionValue;

  if(_position.isEmpty){
    return positionValue = 999;
  }

  positionRandom = random.nextInt(_position.length); //Pega uma posição aleatoria no comprimento da lista

  positionValue = _position[positionRandom]; //Pega o valor do numero da posição aleatoria

  _position.remove(positionValue); //Remove o numero utilizado da Lista

  return positionValue;

}






//------------------------------------------------------------------------//





//TODO pages

//TODO pageTemporary.dart
class Temporary extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      headerSecondary("Pagina Temporaria", _bodyTemp, context);
}

_bodyTemp() {
  return Center(
    child: Container(
      color: Colors.white38,
      child: Text("Pagina Temporaria", style: TextStyle(color: Colors.black),),
    ),
  );
}

//*********************************************************************//





//------------------------------------------------------------------------//

