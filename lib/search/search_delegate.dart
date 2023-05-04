import 'package:derechos_app/providers/derechos_provider.dart';
import 'package:diacritic/diacritic.dart';
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
    return Text('');
  }

  Widget _emptyContainer() {
    return Container(
      child: const Center(
          child: Text('No se encontraton resultados',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 17))),
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

          List filterList = data
              .where((persona) =>
                  removeDiacritics(persona['nombre']).toLowerCase().contains(removeDiacritics(query.toLowerCase()))
                      ? true
                      : false)
              .toList();

          List result = filterList.isNotEmpty
              ? filterList
              : data
                  .where((persona) => removeDiacritics(persona['descripcion'])
                          .toLowerCase()
                          .contains(removeDiacritics(query.toLowerCase()))
                      ? true
                      : false)
                  .toList();

          if (result.isEmpty) return _emptyContainer();

          return ListView.builder(
            shrinkWrap: true,
            itemCount: result.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text(result[index]['nombre']),
              subtitle: Text(
                result[index]['descripcion'],
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () => Navigator.pushNamed(context, 'details',
                  arguments: result[index]),
            ),
          );
        });
  }
}
