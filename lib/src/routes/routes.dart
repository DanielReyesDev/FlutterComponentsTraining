import 'package:flutter/material.dart';

import 'package:components_training/src/pages/alert_page.dart';
import 'package:components_training/src/pages/avatar_page.dart';
import 'package:components_training/src/pages/home_page.dart';
import 'package:components_training/src/pages/card_page.dart';
import 'package:components_training/src/pages/animated_container.dart';
import 'package:components_training/src/pages/input_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context ) => HomePage(),
    'alert': (BuildContext context ) => AlertPage(),
    'avatar': (BuildContext context ) => AvatarPage(),
    'card': (BuildContext context ) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'inputs': (BuildContext context) => InputPage()
  };
}