import 'package:derechos_app/search/search_delegate.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
        appBar: AppBar(
          title: const Text('Inicio'),
          actions: [
            IconButton(
                onPressed: () => showSearch(context: context, delegate: DerechoSearchDelegate()), 
                icon: const Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
          
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  const [DerechosCard()]),
        ));
  }
}
