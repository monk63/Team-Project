import 'dart:async';

import 'package:flutter/material.dart';

import 'login_screen.dart';

// Reference : https://github.com/AminullahTajMuhammad/login_ui_design/tree/master/lib

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 4);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 14, 67, 167),
                gradient: LinearGradient(
                    colors: [(Color.fromARGB(255, 30, 19, 184)), Color.fromARGB(255, 22, 62, 192)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          Center(
            child: Container(
              child: Image.asset("assets/images/splash.png"),
            ),
          )
        ],
      ),
    );
  }
}
