import 'package:flutter/material.dart';
import 'package:stunting_apps/gizi.dart';
import 'package:stunting_apps/stimulasi.dart';
import 'package:stunting_apps/video.dart';

class Penanganan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PENANGANAN"),
          backgroundColor: Colors.lightBlueAccent[100],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("img/bg2.jpg"), fit: BoxFit.cover
            )
          ),
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                        margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: new Center(
                          child: ButtonTheme(
                              minWidth: 200.0,
                              height: 100,
                              child: new FlatButton(
                                padding: EdgeInsets.all(0),
                                color: Colors.lightBlueAccent[100],
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Gizi();
                                  }));
                                },
                                child: new Container(
                                    child: Text(
                                  "PERBAIKAN GIZI",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                            color: Colors.lightBlue,
                                            offset: Offset(1, 2),
                                            blurRadius: 2)
                                      ]),
                                )),
                              )),
                        ),
                      ),
                ],
              ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: new Center(
                      child: ButtonTheme(
                          minWidth: 200.0,
                          height: 100,
                          child: new FlatButton(
                            padding: EdgeInsets.all(0),
                            color: Colors.lightBlueAccent[100],
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Video();
                              }));
                            },
                            child: new Container(
                                child: Text(
                              "STIMULASI",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                        color: Colors.lightBlue,
                                        offset: Offset(1, 2),
                                        blurRadius: 2)
                                  ]),
                            )),
                          )),
                    ),
                  ),
            ],
          ),
        ));
  }
}