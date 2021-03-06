import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";


// import "package:flutter/material.dart" para material design "Android"
// import "package:flutter/cupertino.dart" para cupertino "IOS"

void main() => runApp(HolaMundo());

// stl para que salga la plantilla de StatelessWidget
class HolaMundo extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Tarea 1"),
            ), // encabezado
            body:
              Center(
                child: ClipPath(
                  child: Image.network("https://i.pinimg.com/originals/48/a3/d1/48a3d17fb047aeaa365c7134425d9743.jpg"),
                    clipper: MyClipper(),

                ),
              ) ,
        ),
      );
}
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width * 0.2, 0);
    path.lineTo(size.width * 0.8, 0);
    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(0, size.height * 0.5);
    path.lineTo(size.width * 0.2, 0);

    path.close();
    return path;
  }
  @override
  bool shouldReclip(MyClipper oldClipper) => false;
}