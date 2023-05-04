import 'package:derechos_app/providers/derechos_provider.dart';
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

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
        Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 10,
          shadowColor: AppTheme.primary.withOpacity(0.5),
          child: Column(
            children: const [
              FadeInImage(
                image: AssetImage("assets/image_33262864.png"),
                placeholder: AssetImage("assets/l-loading.gif"),
                width: double.infinity,
                height: 250,
                fit: BoxFit.none,
                fadeInDuration: Duration(milliseconds: 300),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Scrollbar(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: _datos.length,
            // separatorBuilder: (BuildContext context, int index) => const Divider(),
            itemBuilder: (BuildContext context, int index) => Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 7,
              shadowColor:
                  const Color.fromARGB(255, 40, 51, 112).withOpacity(0.5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    title: Text(_datos[index]['nombre']),
                    subtitle: Text(_datos[index]['descripcion'],
                        overflow: TextOverflow.ellipsis),
                    onTap: () => Navigator.pushNamed(context, 'details',
                        arguments: _datos[index]),
                  ),
                ],
              ),
            ),

            // itemBuilder: (BuildContext context, int index) => ListTile(
            //   title: Text(_datos[index]['nombre']),
            //   trailing: const Icon(Icons.arrow_forward_ios_outlined),
            //   subtitle: Text(
            //     _datos[index]['descripcion'],
            //     overflow: TextOverflow.ellipsis,
            //   ),
            //   onTap: (

            //   ) => Navigator.pushNamed(context, 'details', arguments: _datos[index]),
            // ),
          ),
        ),
      ],
    );
  }
}
