import 'package:flutter/material.dart';
import 'package:stunting_apps/akun.dart';
import 'package:stunting_apps/daftarbaru.dart';
//import 'package:stunting_apps/awal.dart';
import 'package:stunting_apps/depan.dart';
//import 'package:stunting_apps/depanbaru.dart' as prefix0;
import 'package:stunting_apps/login.dart';
import 'package:stunting_apps/upload.dart';
import 'package:stunting_apps/video.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
