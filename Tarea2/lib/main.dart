import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

void main() => runApp(TEP());

class TEP extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Row(
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
          ), // encabezado
          body: Container(
            child: Stack(
              children: [
                Container(
                  child: ListView(
                    children: [
                      Container(
                          margin: EdgeInsets.all(1),
                          padding: EdgeInsets.all(0),
                          alignment: Alignment.centerLeft,
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: ListTile(
                              title:
                                  Text("Bien y tu?", textAlign: TextAlign.left),
                              subtitle:
                                  Text("9:55", textAlign: TextAlign.right),
                            ),
                          )),
                      Container(
                          child: Card(
                        color: Color(0xFFDCF8C6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: ListTile(
                          title: Text("Bien y tu?", textAlign: TextAlign.right),
                          subtitle: Text("9:55", textAlign: TextAlign.right),
                          trailing:
                              Icon(Icons.done_all, color: Color(0xFF34B7F1)),
                          contentPadding: EdgeInsets.only(left: 250),
                        ),
                      )),
                      BubbleSpecialOne(
                        text: 'bubble special one with tail',
                        isSender: false,
                        color: Colors.white,
                        textStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      BubbleSpecialOne(
                        text: 'bubble special one with tail',
                        color: Color(0xFFDCF8C6),
                        seen: true,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://i.pinimg.com/originals/48/a3/d1/48a3d17fb047aeaa365c7134425d9743.jpg"),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25)),
                                child: TextFormField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                    hintText: "Escribir mensaje",
                                    border: InputBorder.none,
                                    prefixIcon: IconButton(
                                        icon: Icon(
                                            Icons.emoji_emotions_outlined,
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
                              radius: 20,
                              backgroundColor: Color(0xFF128C7E),
                              child: IconButton(
                                  icon: Icon(Icons.mic, color: Colors.white),
                                  onPressed: () {}),
                            )
                          ],
                        ),
                      )),
                )
              ],
            ),
          )));
}
