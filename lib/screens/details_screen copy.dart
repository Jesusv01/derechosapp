import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final Object derecho =
    //     ModalRoute.of(context)?.settings.arguments as Object;
    // print(derecho);

    final derechoMap = (ModalRoute.of(context)!.settings.arguments as Map);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _customAppBar(derechoMap),
          SliverList(
            delegate: SliverChildListDelegate([
              _Overview(derechoMap),
            ]),
          )
        ],
      ),
    );
  }
}

class _customAppBar extends StatelessWidget {
  final derecho;
  const _customAppBar(this.derecho);
  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 220,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        // title: Container(
        //     width: double.infinity,
        //     alignment: Alignment.bottomCenter,
        //     padding: const EdgeInsets.only(bottom: 10, left: 20, right:20),
        //     color: Colors.black12,
        //     child: Text(
        //       derecho['nombre'],
        //       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        //     )),
        background: FadeInImage(
            image: NetworkImage(
                'https://media.istockphoto.com/id/184986474/es/foto/bandera-de-el-salvador.jpg?s=612x612&w=0&k=20&c=kf-BaIDBvWEm_WzshNhCd_KG81zbog7DJqXNy4zr0ek='),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fit: BoxFit.cover),
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final derecho;
  const _Overview(this.derecho);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            alignment: Alignment.bottomLeft,
            child: Text(
              derecho['nombre'],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Text(
              derecho['descripcion'],
              textAlign: TextAlign.justify,
              // style: Theme.of(context).textTheme.subtitle1,
            )),
      ],
    );
  }
}
