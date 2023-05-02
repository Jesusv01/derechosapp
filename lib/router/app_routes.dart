
import 'package:derechos_app/screens/screens.dart';
import 'package:flutter/material.dart';
import '../models/menu_option.dart';

class AppRoutes {

  static const inictialRoute = 'home';

  static final menuOptions = <MenuOption> [
    // MenuOption(route: 'home', name: 'Home Screen', screen: const HomeScreen(), icon: Icons.home_max_sharp),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    
    appRoutes.addAll({ 'home' : (BuildContext context ) => const HomeScreen() });

    for (final option in menuOptions ){
      appRoutes.addAll({ option.route : (BuildContext context ) => option.screen });
    }
    return appRoutes;
  }

  // static Map<String, Widget Function(BuildContext)> routes = {
  //     'home': (BuildContext context) => const HomeScreen(),
  //     'listView1': (BuildContext context) => const Listview1Screen(),
  //     'listView2': (BuildContext context) => const Listview2Screen(),
  //     'alert': (BuildContext context) => const AlertScreen(),
  //     'card': (BuildContext context) => const CardScreen() 
  // };

  // static Route<dynamic> onGenerateRoute( RouteSettings settings ) {
  //   return MaterialPageRoute(builder: (context) => const AlertScreen());
  // }
}