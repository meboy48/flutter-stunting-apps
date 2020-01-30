import 'package:flutter/material.dart';
import 'package:stunting_apps/penyebab.dart';

class Stunting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return Navigator.canPop(context);
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text("APA ITU STUNTING?"),
            backgroundColor: Colors.lightBlueAccent[100],
            actions: <Widget>[
            ],
          ),
          body: Container(
            decoration: BoxDecoration(image: DecorationImage(
              image: AssetImage("img/bg2.jpg"), fit: BoxFit.fill
            )),
            child: ListView(children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: Image.asset("img/avatar.jpg"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 30),
                    color: Colors.lightBlueAccent[100],
                    padding: EdgeInsets.all(10),
                    child: Center(
                        child: Text(
                            "Stunting (kerdil) merupakan keadaan gagal tumbuh pada anak balita akibat kekurangan gizi dalam waktu cukup lama (kronis) sehingga anak terlalu pendek untuk usianya.", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: ButtonTheme(
                          minWidth: 120,
                          child: RaisedButton(
                            child: Text("Kembali", style: TextStyle(color: Colors.white),),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                        Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: ButtonTheme(
                          minWidth: 120,
                          child: RaisedButton(
                            child: Text("Selanjutnya", style: TextStyle(color: Colors.white),),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Penyebab();
                              }));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ]),
          )),
    );
  }
}
