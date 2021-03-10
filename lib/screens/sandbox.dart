import 'package:flutter/material.dart';

class Sandbox extends StatefulWidget {
  @override
  _SandboxState createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  Color _color = Colors.blue;
  double _width = 200;
  double _height = 200;
  double _opacity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: _opacity,
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                color: _color,
                width: _width,
                height: _height,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _height = 400;
                  _width = 400;
                });
              },
              child: Text('Animate Height and Width'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _color = Colors.teal;
                });
              },
              child: Text('Animate Color'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _opacity = 0;
                });
              },
              child: Text('Animate Opacity'),
            ),
          ],
        ),
      ),
    );
  }
}
