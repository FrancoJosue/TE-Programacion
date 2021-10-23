import 'package:flutter/material.dart';

void main() => runApp(TEP());

class TEP extends StatefulWidget {
  @override
  createState() => Estado();
}

class Estado extends State<TEP> {
  String nombre = "";
  TextEditingController nombreControlador = TextEditingController();
  TextEditingController apellidoControlador = TextEditingController();
  bool hasTenidoTos = false;
  bool hasTenidoTmp = false;
  String turno = "";
  double edad = 18;

  @override
  Widget build(BuildContext context) => MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              title: Text("Bienvenido: $nombre"),
              backgroundColor: Colors.black38),
          body: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nombreControlador,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: "Escribe tu nombre",
                    hintText: "Juan",
                  ),
                  maxLength: 15,
                ),
                TextField(
                  controller: apellidoControlador,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person_outline),
                    labelText: "Escribe tu apellido",
                    hintText: "Perez",
                  ),
                  maxLength: 15,
                ),
                CheckboxListTile(
                    title: Text("Has tenido tos?"),
                    value: hasTenidoTos,
                    onChanged: (bool? value) {
                      setState(() {
                        hasTenidoTos = value!;
                      });
                    }),
                SwitchListTile(
                    title: Text("Has tenido temperatura?"),
                    value: hasTenidoTmp,
                    onChanged: (bool value) {
                      setState(() {
                        hasTenidoTos = value;
                      });
                    }),
                RadioListTile(
                    title: Text("Matutino"),
                    value: "Matutino",
                    groupValue: turno,
                    onChanged: (value) {
                      setState(() {
                        turno = value.toString();
                      });
                    }),
                RadioListTile(
                    title: Text("Vespertino"),
                    value: "Vespertino",
                    groupValue: turno,
                    onChanged: (value) {
                      setState(() {
                        turno = value.toString();
                      });
                    }),
                Slider(
                  label: edad.toString(),
                  min: 18,
                  max: 99,
                  value: edad,
                  divisions: 81,
                  onChanged: (double value) {
                    setState(() {
                      edad = value;
                    });
                  },
                ),
                ElevatedButton(
                  child: Icon(Icons.send),
                  onPressed: () {
                    setState(() {
                      nombre = nombreControlador.text +
                          " " +
                          apellidoControlador.text;
                      print(nombre);
                    });
                  },
                ),
              ],
            ),
          )));
}