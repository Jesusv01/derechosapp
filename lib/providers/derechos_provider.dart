import 'dart:convert';

import 'package:derechos_app/models/derechos_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DerechosProvider extends ChangeNotifier {
  final String baseUrl =
      'https://derechos-app-default-rtdb.firebaseio.com/derechos_humanos.json';

  DerechosProvider() {
    getDerechos();
  }

  getDerechos() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      // final derechosResponse = DerechosResponse.fromJson(response.body);
      final List<dynamic> decodedData = json.decode(response.body);

      String letra = 'libertad';

      List personasMayores30 =
          decodedData.where((persona) => persona['nombre'].toLowerCase().contains(letra.toLowerCase())).toList();

      
      return decodedData;
    } catch (e) {
      return e;
    }
  }
}
