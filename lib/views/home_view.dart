import 'package:flutter/material.dart';
import 'package:flutter_learn/views/calculate_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: CalculaterView(),
      ),
    );
  }
}
