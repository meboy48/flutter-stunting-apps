import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stunting_apps/depan.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5),()=> Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return HalamanAwal();
                              })) );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.lightBlueAccent),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("img/logoApp1.png", height: 200.0, width: 200.0,)
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  Text("Aplikasi Cek STUNTING",
                style: TextStyle(fontSize: 15, color: Colors.white, shadows: [
                  Shadow(
                      color: Colors.lightBlue,
                      offset: Offset(1, 2),
                      blurRadius: 2)
                ],fontWeight: FontWeight.bold),)
                ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}