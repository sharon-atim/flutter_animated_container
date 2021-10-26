import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Animations Demo',
    home: AnimatedContainerApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class AnimatedContainerApp extends StatefulWidget {
  const AnimatedContainerApp({Key? key}) : super(key: key);

  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  // Initial values for the animation container.
  double _height = 100.0;
  double _width = 100.0;
  Color _color = Colors.purple;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  final String _title = 'Animation Demo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(_title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: _height,
              width: _width,
              curve: Curves.fastOutSlowIn,
              decoration:
                  BoxDecoration(color: _color, borderRadius: _borderRadius),
            ),
            // Animation starts when ElevatedButton is pressed.
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white),
              child: const Text(
                'Animate Container',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                animateContainerMethod();
              },
            ),
          ],
        ),
      ),
    );
  }

  void animateContainerMethod() {
    setState(() {
      // The Random() method creates a random number generator which is passed to the new state values.
      final random = Random();

      // Generates a random width and height.
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();

      // Generates a random color.
      _color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
      // Generates a random border radius
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
