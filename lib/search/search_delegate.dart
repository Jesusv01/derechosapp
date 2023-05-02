import 'package:derechos_app/providers/derechos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DerechoSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar derecho';
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text('BuildActions');
  }

  Widget _emptyContainer() {
    return Container(
      child: const Center(
        child: Icon(
          Icons.hourglass_empty_outlined,
          color: Colors.black38,
          size: 100,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyContainer();
    }

    final derechosProvider =
        Provider.of<DerechosProvider>(context, listen: false);

    return FutureBuilder(
        future: derechosProvider.getDerechos(),
        builder: (_, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) return _emptyContainer();

          final data = snapshot.data;

          List filterList =
          data.where((persona) => persona['nombre'].toLowerCase().contains(query.toLowerCase()) ? true : false).toList();

          if(filterList.isEmpty) return _emptyContainer();

          return ListView.builder(
            shrinkWrap: true,
            itemCount: filterList.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text(filterList[index]['nombre']),
              subtitle: Text(
                filterList[index]['descripcion'],
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {
                print(filterList[index]['nombre']);
              },
            ),
          );
        });

    // }
  }

// class _DerechosItem extends StatelessWidget {
//   final String derecho;

//   const _DerechosItem(this.derecho);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile();
//   }
}
