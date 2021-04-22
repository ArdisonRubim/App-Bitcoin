import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _precoBitcoin = "0";

  void _atualizar() async {

    String urlBitcoin = "https://blockchain.info/ticker";
    http.Response response;
    response = await http.get(urlBitcoin);

    Map<String, dynamic> retorno = json.decode(response.body);

    setState(() {
      _precoBitcoin = retorno["BRL"]["buy"].toString();
    });

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(20),
              child: Image.asset("imagens/logo.jpg"),
            ),
            Padding(padding: EdgeInsets.all(16),
              child: Text("R\$ " + _precoBitcoin,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white
              ),
              ),
            ),
            RaisedButton(
              color: Colors.amber,
              child: Text("Atualizar",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                ),
                onPressed: _atualizar,
            ),
            Padding(padding: EdgeInsets.all(20),
            child: Text("Preço atualizado a cada 15min",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white
            ),
            ),
            )
          ],
        ),
      ),
    );
  }
}
