
import 'package:components_training/src/pages/alert_page.dart';
import 'package:components_training/src/pages/avatar_page.dart';
import 'package:components_training/src/pages/home_page.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context ) => HomePage(),
        'alert': (BuildContext context ) => AlertPage(),
        'avatar': (BuildContext context ) => AvatarPage(),
      },
    );
  }
}