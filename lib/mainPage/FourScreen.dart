import 'package:flutter/material.dart';

import 'ThreeScreen.dart';
import 'TwoScreen.dart';

class FourScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => ThressScreen(),
        '/two':(context) => TwoScreen(),
      },

    );
  }

}