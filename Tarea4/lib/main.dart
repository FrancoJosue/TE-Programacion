import 'package:all_sensors/all_sensors.dart';
import 'package:flutter/material.dart';

void main() => runApp(TEP());

class TEP extends StatefulWidget {
  @override
  createState() => Estado();
}

class Estado extends State<TEP> {
  double ejex=0.0;

  @override
  void initState() {
    super.initState();
    gyroscopeEvents.listen((event) {
      setState(() {
        ejex=event.y;
      });
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(backgroundColor: Colors.lightGreen,
              title: Text("Giroscopio $ejex"),
            ),
            body: Container(

              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "http://3.bp.blogspot.com/-ZM5ufGYKULA/UcsS8KPwncI/AAAAAAAAG1A/zzIsHqqLWpI/s1600/Descargar+Pack+Gratis+Wallpaper+Ni%C3%83%C2%B1os+peque%C3%83%C2%B1os+(89).jpg"),
                    fit: BoxFit.cover,
                  )
              ),
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  AnimatedContainer(
                    alignment: Alignment(ejex, -.4),
                      duration: Duration(seconds: 2),
                      child: Image.asset(
                        'lib/jorge.png',
                        width: 80,
                      )),
                  Container(child: Image.asset('lib/liana.png')),

                ],
              ),
            )),
      );
}
