import 'package:flutter/material.dart';
import 'package:flutter_learn/views/home_view.dart';

class myApp extends StatelessWidget {
  const myApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "myApp",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeView());
  }
}
