import 'package:flutter/material.dart';
import 'package:foxbit_hiring_test_template/app/navigator.dart';

class FoxbitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foxbit Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      routes: appRoutes,
    );
  }
}