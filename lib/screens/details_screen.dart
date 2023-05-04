import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final derechoMap = (ModalRoute.of(context)!.settings.arguments as Map);

    return Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
            // title: const Text('Inicio'),
            ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              // width: 500,
              // height: 400,
              alignment: Alignment.center,
              child: Container(
                width: 300,
                height: 330,
                alignment: Alignment.center,
                child: const Image(image: AssetImage('assets/NU-image.png')),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(derechoMap['nombre'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25,
                      )),
                ),
                Container(
                  width: 360,
                  height: 2,
                  color: Colors.white,
                ),
                Container(
                  // constraints: const BoxConstraints(maxWidth: 280),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20.0),
                  child: Text(derechoMap['descripcion'],
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 15)),
                ),
              ],
            )
          ],
        ));
  }
}
