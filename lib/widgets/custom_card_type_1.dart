
import 'package:flutter/material.dart';

class CustomCardType1 extends StatefulWidget {

  const CustomCardType1({
    super.key,
  });

  @override
  State<CustomCardType1> createState() => _CustomCardType1State();
}

class _CustomCardType1State extends State<CustomCardType1> {
  List<Map<String, dynamic>> objectArray = [
      {
         "nombre": "Derecho a la vida",
         "descripcion": "Todo ser humano tiene derecho a la vida, a la libertad y a la seguridad de su persona."
      },
      {
         "nombre": "Derecho a la libertad y la seguridad",
         "descripcion": "Toda persona tiene derecho a la libertad y a la seguridad personales. Nadie podrá ser sometido a detención o prisión arbitrarias."
      },
      // {
      //    "nombre": "Derecho a la igualdad ante la ley",
      //    "descripcion": "Todas las personas son iguales ante la ley y tienen derecho a igual protección de la ley sin discriminación alguna y, en particular, sin distinción de raza, nacionalidad o religión."
      // },
      // {
      //    "nombre": "Derecho a un juicio justo",
      //    "descripcion": "Toda persona tiene derecho a un juicio justo y público, sin dilaciones indebidas, ante un tribunal independiente e imparcial."
      // },
      // {
      //    "nombre": "Derecho a la libertad de pensamiento, conciencia y religión",
      //    "descripcion": "Toda persona tiene derecho a la libertad de pensamiento, de conciencia y de religión."
      // },
      // {
      //    "nombre": "Derecho a la libertad de expresión",
      //    "descripcion": "Toda persona tiene derecho a la libertad de opinión y de expresión; este derecho incluye el de no ser molestado a causa de sus opiniones, el de investigar y recibir información y opiniones, y el de difundirlas, sin limitación de fronteras, por cualquier medio de expresión."
      // }
  ];
  List<String> myList = ['elemento1', 'elemento2', 'elemento3'];

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      // ListView.builder(
      //   itemBuilder: (context, index) {
      //     return Text('asdasd');
      //   }
      // )
    // ListView.separated(
    //   itemBuilder: (context, index) => ListTile(
    //     title: Text(objectArray[index] as String),
    //     // onTap: () {
    //     //   // final route = MaterialPageRoute(builder: (context) => const Listview1Screen());
    //     //   // Navigator.push(context, route);
    //     // },
    //   ), 
    //   separatorBuilder: (_, __) => const Divider(), 
    //   itemCount: objectArray.length,
    //   )

    Expanded(
      child: ListView.builder(
      itemCount: myList.length,
      itemBuilder: (BuildContext context, int index) {
      final item = myList[index];
      return item != null ? ListTile(
        title: Text(item),
      ) : SizedBox();
      },
    ),
    )

      ]
    );
  }
}