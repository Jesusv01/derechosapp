import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final Object derecho =
    //     ModalRoute.of(context)?.settings.arguments as Object;
    // print(derecho);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _customAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _Overview(),
              _Overview(),
            ]),
          )
        ],
      ),
    );
  }
}

class _customAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            color: Colors.black12,
            child: const Text(
              'derecho.title',
              style: TextStyle(fontSize: 16),
            )),
        background: const FadeInImage(
            image: NetworkImage(
                'https://media.istockphoto.com/id/184986474/es/foto/bandera-de-el-salvador.jpg?s=612x612&w=0&k=20&c=kf-BaIDBvWEm_WzshNhCd_KG81zbog7DJqXNy4zr0ek='),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fit: BoxFit.cover),
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: const Text(
          'Tempor reprehenderit ad esse amet amet est tempor in deserunt esse est eu nulla. Duis dolore enim in duis culpa cupidatat minim pariatur eu. Duis eu elit est nulla. Consectetur aute fugiat qui commodo. Tempor duis officia officia nulla duis nisi enim reprehenderit nulla. Ex magna laborum amet tempor exercitation id reprehenderit. Do dolor qui commodo et do culpa velit consequat sunt. Laboris aliqua aliquip laboris nulla et consequat non enim occaecat ullamco nulla adipisicing incididunt. Nostrud dolor nostrud occaecat adipisicing minim esse non id. Dolor eu veniam anim excepteur.',
          textAlign: TextAlign.justify,
          // style: Theme.of(context).textTheme.subtitle1,
        ));
  }
}
