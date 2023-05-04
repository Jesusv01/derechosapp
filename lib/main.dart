
import 'package:derechos_app/providers/derechos_provider.dart';
import 'package:derechos_app/router/app_routes.dart';
import 'package:derechos_app/screens/details_screen.dart';
import 'package:derechos_app/screens/home_screen.dart';
import 'package:derechos_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(const AppState());

  class AppState extends StatelessWidget {
  const AppState({super.key});

    @override
    Widget build(BuildContext context){
      return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => DerechosProvider(), lazy: false)],
        child: const MyApp(),
      );
    }
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      color: Colors.blue[900],
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: SplashScreen(
        seconds: 5,
        navigateAfterSeconds: const HomeScreen(),
        image: Image.asset('assets/image_33262864.png'),
        photoSize: 250.0,        
        backgroundColor: Colors.blue[900],
        styleTextUnderTheLoader: const TextStyle(),
        loaderColor: Colors.white
      ),
      // home: const HomeScreen(),
      routes: {
        'details': (context) => const DetailsScreen()
      },
      initialRoute: AppRoutes.inictialRoute,
      //routes: AppRoutes.getAppRoutes(),
      // onGenerateRoute: AppRoutes.onGenerateRoute
    );
  }
}