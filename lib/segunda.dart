import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ListadoDeLibros extends StatefulWidget {
  String nua;

  ListadoDeLibros(
    this.nua,
  );

  @override
  _ListadoDeLibrosState createState() => _ListadoDeLibrosState();
}

class _ListadoDeLibrosState extends State<ListadoDeLibros> {
  Map data;
  List userData;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prestamos de ${widget.nua}'),
      ),
      body: ListView.builder(
        itemCount: userData == null ? 0 : userData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: userData[index]["expired"]
                ? Color.fromRGBO(255, 128, 128, 10)
                : Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${userData[index]["title"]}",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "${userData[index]["author"]}, ${userData[index]["edition"]} edición, ${userData[index]["editorial"]}"),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Text("Rentado: ${userData[index]["borrowed_on"]}"),
                      ),
                      Text("Vence: ${userData[index]["expires_on"]}"),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future getData() async {
    http.Response response = await http
        .get('https://biblioteca.polygondevs.com/pendientes?nua=${widget.nua}');
    print(userData.toString());
    print(response.body);
    data = json.decode(response.body);
    setState(() {
      userData = data["due_list"];
    });
  }
}
