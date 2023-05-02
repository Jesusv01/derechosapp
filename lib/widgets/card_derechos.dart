import 'package:derechos_app/providers/derechos_provider.dart';
import 'package:flutter/material.dart';

class DerechosCard extends StatefulWidget {
  const DerechosCard({Key? key}) : super(key: key);

  @override
  State<DerechosCard> createState() => _DerechosCardState();
}

// class Item {
//   Item({
//     required this.nombre,
//     required this.descripcion,
//   });

//   String nombre;
//   String descripcion;
// }

// List<Item> getItems() {
//   List<Item> listaDerechosHumanos = [];
//   for (Map<String, dynamic> derechoHumano in objectArray) {
//     listaDerechosHumanos.add(Item(
//         nombre: derechoHumano['nombre'],
//         descripcion: derechoHumano['descripcion']));
//   }

//   return listaDerechosHumanos;
// }

// Future<List<dynamic>> fetchData() async {
//   final response = await http.get(Uri.parse(
//       'https://derechos-app-default-rtdb.firebaseio.com/derechos_humanos.json'));
//   if (response.statusCode == 200) {
//     // var data = json.decode(response.body);
//     return json.decode(response.body);
//   } else {
//     // Si la solicitud falló, lanza una excepción
//     throw Exception('Error al cargar los datos');
//   }
//   // Hacer algo con los datos
// }

class _DerechosCardState extends State<DerechosCard> {
  List<dynamic> _datos = [];
  final obArray = DerechosProvider().getDerechos();

  @override
  void initState() {
    super.initState();
    obArray.then((value) {
      setState(() {
        _datos = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FadeInImage(
          image: NetworkImage(
              'https://media.istockphoto.com/id/184986474/es/foto/bandera-de-el-salvador.jpg?s=612x612&w=0&k=20&c=kf-BaIDBvWEm_WzshNhCd_KG81zbog7DJqXNy4zr0ek='),
          placeholder: AssetImage("assets/jar-loading.gif"),
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
          fadeInDuration: Duration(milliseconds: 300),
        ),

        const SizedBox(height: 10),
        // SizedBox(
        //   width: 500,
        //   child: TextField(
        //     decoration: InputDecoration(
        //       hintText: 'Buscar',
        //       prefixIcon: const Icon(Icons.search),
        //       border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(10.0),
        //       ),
        //     ),
        //   ),
        // ),
        // const SizedBox(height: 10),

        SizedBox(
          height: 700,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: _datos.length,
            separatorBuilder: (BuildContext context, int index) => const Divider(),
            itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text(_datos[index]['nombre']),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              subtitle: Text(
                _datos[index]['descripcion'],
                overflow: TextOverflow.ellipsis,
              ),
              onTap: (
                
              ) => Navigator.pushNamed(context, 'details', arguments: 'movie-intance'),
            ),
          ),
        ),

        // SingleChildScrollView(
        //   child: ExpansionPanelList(
        //     expansionCallback: (int index, bool isExpanded) {
        //       setState(() {
        //         _steps[index].isExpanded = !isExpanded;
        //       });
        //     },
        //     children: _steps.map<ExpansionPanel>((Item step) {
        //       return ExpansionPanel(
        //         headerBuilder: (BuildContext context, bool isExpanded) {
        //           return ListTile(
        //             title: Text(step.nombre),
        //           );
        //         },
        //         body: ListTile(
        //           title: Text(step.body),
        //         ),
        //         isExpanded: step.isExpanded,
        //       );
        //     }).toList(),
        //   ),
        // ),
      ],
    );
  }
}
