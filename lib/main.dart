import 'package:flutter/material.dart';
import 'package:flutter_task/pages/home.dart';
import 'package:flutter_task/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    // NavigationRailPage.tag: (context) => NavigationRailPage(),
    // LoginPage.tag: (context) => LoginPage(),
    MyHomePage.tag: (context) => MyHomePage(),

    SplashPage.tag: (context) => SplashPage(),
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      routes: routes,
    );
  }
}
