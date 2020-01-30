import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("STUNTING APP",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blueAccent[100],
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            color: Colors.blue[200],
            child: RaisedButton(
              padding: EdgeInsets.all(30.0),
              color: Colors.blue[200],
              child: Text("1. Apa itu Stunting ?"),
              onPressed: _launchURL1,
                
             
            ),
          ),
          Container(
            color: Colors.blue[200],
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: RaisedButton(
              padding: EdgeInsets.all(30.0),
              color: Colors.blue[200],
              child: Text("2. Bagaimana mencegah Stunting ?"),
              onPressed: _launchURL2
                
              
            ),
             
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.fromLTRB(50, 10, 50, 100),
            child: RaisedButton(
               padding: EdgeInsets.all(30.0),
              color: Colors.blue[200],
              child: Text("kembali"), onPressed: () {},),
          )
        ],
      ),
    );
  }
}

_launchURL1() async {
  const url = 'https://www.youtube.com/watch?v=8izqDIeoy3M';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL2() async {
  const url = 'https://www.youtube.com/watch?v=YOf59clsY9s';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}