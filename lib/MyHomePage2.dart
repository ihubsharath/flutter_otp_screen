import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage2 extends StatefulWidget {
  String title;
  MyHomePage2({this.title});
  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RectangularShape(width, height),
                  RectangularShape(width, height),
                  RectangularShape(width, height),
                  RectangularShape(width, height),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(
                  letterSpacing: width * 0.22,
                ),
                // textAlign: TextAlign.center,
                decoration: new InputDecoration(
                  hintText: '1',
                  // border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RectangularShape extends StatelessWidget {
  double width;
  double height;
  RectangularShape(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.2,
      width: width * 0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 1),
      ),
    );
  }
}
