// ignore_for_file: avoid_print

import 'dart:math';

import 'package:color_generator/colors.dart';
 import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Random random = Random();
  int index = 0;

  void changeIndex() {
    setState(
      () => index = random.nextInt(10),
    );
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    

    return Scaffold(
      backgroundColor: BackgroundColors.bgColors[index],
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              print('tapped!');
              changeIndex();
            },
            onTapDown: (TapDownDetails details) => _onTapDown(details),
            onTapUp: (TapUpDetails details) => _onTapUp(details),
          ),
          Positioned(
            left: size.width / 6,
            right: size.width / 6,
            bottom: size.height / 2,
            child: const Center(
              child: Text(
                "Hello There!",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onTapDown(TapDownDetails details) {
    var x = details.globalPosition.dx;
    var y = details.globalPosition.dy;
     print(details.localPosition);
    print("tap down $x, $y");
  }

  _onTapUp(TapUpDetails details) {
    var x = details.globalPosition.dx;
    var y = details.globalPosition.dy;
     print(details.localPosition);
    print("tap up $x, $y");
  }
}
