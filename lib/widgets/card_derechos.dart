import 'package:derechos_app/providers/derechos_provider.dart';
import 'package:flutter/material.dart';


class DerechosCard extends StatefulWidget {
  const DerechosCard({Key? key}) : super(key: key);

  @override
  State<DerechosCard> createState() => _DerechosCardState();
}

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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          // width: 500,
          // height: 400,
          alignment: Alignment.center,
          child: Container(
            width: 400,
            height: 200,
            alignment: Alignment.center,
            child: const Image(
                image: AssetImage('assets/image_33262864.png'),
                fit: BoxFit.contain),
          ),
        ),
        SizedBox(
          width: 370,
          // height: 500,
          child: Scrollbar(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: _datos.length,
              itemBuilder: (BuildContext context, int index) => Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 7,
                shadowColor:
                    const Color.fromARGB(255, 40, 51, 112).withOpacity(0.5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      trailing: const Icon(Icons.article_rounded),
                      title: Text(_datos[index]['nombre']),
                      subtitle: Text(_datos[index]['descripcion'],
                          overflow: TextOverflow.ellipsis),
                      onTap: () => Navigator.pushNamed(context, 'details',
                          arguments: _datos[index]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
