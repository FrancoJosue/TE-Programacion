import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tarea3/bubble_especial_one.dart';

void main() => runApp(TEP());

class TEP extends StatefulWidget {
  @override
  createState() => Estado();
}

class Estado extends State<TEP> {
  String mensaje = "";
  List<Widget> mensajes = [
    BubbleFranco(
      text: "Franco burbuja custom",
      hora: "9:59",
      color: Color(0xFFDCF8C6),
      isSender: true,
      seen: true,
    ),
    BubbleFranco(
      text: "Visto",
      hora: "9:59",
      color: Color(0xFFDCF8C6),
      isSender: true,
      seen: false,
      delivered: true,
    ),
    BubbleFranco(
      text: "Hola Franco",
      hora: "10:00",
      color: Colors.white,
      isSender: false,
    ),
  ];

  TextEditingController mensajeControlador = TextEditingController();

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn.donmai.us/sample/32/04/sample-320483448a8ea93cb6366a5a438b6630.jpg")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Yamato",
                      style: TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("últ. vez hoy a las 11:11",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.normal))
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              )
            ],
          ),
          backgroundColor: Color(0xFF128C7E),
          leading: IconButton(
            alignment: Alignment.centerLeft,
            icon: Icon(Icons.arrow_back_outlined),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.call),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.attach_file),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://i.pinimg.com/originals/48/a3/d1/48a3d17fb047aeaa365c7134425d9743.jpg"),
              fit: BoxFit.cover),
        ),
          child: Stack(
            children: [
              Container(
                  child: ListView.builder(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 70),
                    key: Key("ListView"),
                    itemCount: mensajes.length,
                    itemBuilder: (BuildContext contex, int index) {
                      return mensajes[index];
                    },
                  )),
              Container(
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)),
                              child: TextFormField(
                                autocorrect: true,

                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                controller: mensajeControlador,
                                minLines: 1,
                                decoration: InputDecoration(
                                  hintText: "Escribir mensaje",
                                  border: InputBorder.none,
                                  prefixIcon: IconButton(
                                      icon: Icon(Icons.emoji_emotions_outlined,
                                          color: Colors.grey),
                                      onPressed: () {}),
                                  suffixIcon: IconButton(
                                      icon: Icon(Icons.photo_camera_rounded,
                                          color: Colors.grey),
                                      onPressed: () {}),
                                ),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Color(0xFF128C7E),
                            child: IconButton(
                                icon: Icon(Icons.send, color: Colors.white),
                                onPressed: () {
                                  setState(() {
                                    Random rand = Random();
                                    int aux = rand.nextInt(35);
                                    String hora =
                                        DateTime.now().hour.toString() +
                                            ":" +
                                            DateTime.now().minute.toString();
                                    mensaje = mensajeControlador.text;
                                    mensajeControlador.clear();
                                    if (aux % 2 == 0) {
                                      mensajes.add(new BubbleFranco(
                                        text: "$mensaje",
                                        hora: "$hora",
                                        color: Colors.white,
                                        isSender: false,
                                      ));
                                    } else {
                                      mensajes.add(new BubbleFranco(
                                        text: "$mensaje",
                                        hora: "$hora: ",
                                        color: Color(0xFFDCF8C6),
                                        isSender: true,
                                        seen: true,
                                      ));
                                    }
                                  });
                                }),
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ));
}
