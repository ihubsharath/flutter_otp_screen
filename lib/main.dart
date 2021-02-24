import 'package:flutter/material.dart';
import 'package:flutter_otp_screen/MyHomePage2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: MyHomePage2(title: 'Flutter Textfiled POC on bocker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FocusNode one, two, three, four;
  @override
  void initState() {
    setState(() {
      one = FocusNode();
      two = FocusNode();
      three = FocusNode();
      four = FocusNode();
    });
    super.initState();
  }

  void nextField({String value, FocusNode focusNode}) {
    // if (value.length == 1) {
    focusNode.requestFocus();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              "OTP TEST",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                otpTextField(1),
                otpTextField(2),
                otpTextField(3),
                otpTextField(4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget otpTextField(int i) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.1,
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextField(
        autofocus: true,
        focusNode: i == 1
            ? one
            : i == 2
                ? two
                : i == 3
                    ? three
                    : i == 4
                        ? four
                        : null,
        obscureText: true,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          enabledBorder: enabledOutlineInputBorder(),
          focusedBorder: focusedOutlineInputBorder(),
        ),
        onChanged: (value) {
          print("value is:: " + value);
          if (i == 1) {
            if (value.length == 1) {
              nextField(value: value, focusNode: two);
            } else if (value.length == 0) {
              one.unfocus();
            }
          } else if (i == 2) {
            if (value.length == 1) {
              nextField(value: value, focusNode: three);
            } else if (value.length == 0) {
              nextField(value: value, focusNode: one);
            }
          } else if (i == 3) {
            if (value.length == 1) {
              nextField(value: value, focusNode: four);
            } else if (value.length == 0) {
              nextField(value: value, focusNode: two);
            }
          } else if (i == 4) {
            if (value.length == 1) {
              four.unfocus();
            } else if (value.length == 0) {
              nextField(value: value, focusNode: three);
            }
          }
        },
      ),
    );
  }

  OutlineInputBorder enabledOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Colors.black),
    );
  }

  OutlineInputBorder focusedOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Colors.blue),
    );
  }
}
