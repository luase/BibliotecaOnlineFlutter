import 'package:biblioteca_online/segunda.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biblioteca Online',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Biblioteca Online'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String title;
  MyHomePage({
    this.title,
  });
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String nua;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text('NUA:'),
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 6,
                onChanged: (value) {
                  nua = value;
                },
              ),
              RaisedButton(
                child: Text('Ingresar'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListadoDeLibros(nua)));
                },
              )
            ],
          ),
        ));
  }
}
