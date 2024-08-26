import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DVDHomePage(),
    );
  }
}

class DVDHomePage extends StatefulWidget {
  @override
  _DVDHomePageState createState() => _DVDHomePageState();
}

class _DVDHomePageState extends State<DVDHomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double x, y;
  late double dx, dy;
  final double width = 100, height = 60;

  @override
  void initState() {
    super.initState();
    x = 0;
    y = 0;
    dx = 2;
    dy = 2;

    _controller = AnimationController(
      duration: const Duration(days: 365),
      vsync: this,
    )..addListener(() {
        setState(() {
          x += dx;
          y += dy;
          if (x <= 0 || x + width >= MediaQuery.of(context).size.width) dx = -dx;
          if (y <= 0 || y + height >= MediaQuery.of(context).size.height) dy = -dy;
        });
      });

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: x,
            top: y,
            child: Image.asset(
              'assets/dvd_logo.png',
              width: width,
              height: height,
            ),
          ),
        ],
      ),
    );
  }
}

