import 'package:flutter/material.dart';
import 'package:stunting_apps/akun.dart';
import 'package:stunting_apps/deteksi.dart';
import 'package:stunting_apps/histori.dart';
import 'package:stunting_apps/login.dart';
import 'package:stunting_apps/penanganan.dart';
import 'package:stunting_apps/src/api_service.dart';
import 'package:stunting_apps/src/model/anak.dart';
import 'package:stunting_apps/src/model/profile.dart';
import 'package:stunting_apps/stunting.dart';

class Beranda extends StatefulWidget {
  //final String namauser;
  // final String ortuID;
  //AsyncSnapshot<List<Pengguna>> snapshot;
  Pengguna data;
  Beranda({this.data});
  @override
  _BerandaState createState() => _BerandaState(data: this.data);
}

class _BerandaState extends State<Beranda> {
  ApiService _apiService = ApiService();
  Pengguna data;
  String id_anak;
  String nama;
  //final String ortuID;
  _BerandaState({this.data});

  void initState() {
    final dataAnak = _apiService.getProfileAnak(data.id_user);

    dataAnak.then((value) {
      Anak anak = value.single;
     // nama = anak.nama_user;
      id_anak = anak.id_anak;
    });
    super.initState();
  }


  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: roundedButton(
                    "No", const Color(0xFF167F67), const Color(0xFFFFFFFF)),
              ),
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(true),
                child: roundedButton(
                    " Yes ", const Color(0xFF167F67), const Color(0xFFFFFFFF)),
              ),
            ],
          ),
        ) ??
        false;
  }

  Widget roundedButton(String buttonLabel, Color bgColor, Color textColor) {
    var loginBtn = new Container(
      padding: EdgeInsets.all(5.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: bgColor,
        borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF696969),
            offset: Offset(1.0, 6.0),
            blurRadius: 0.001,
          ),
        ],
      ),
      child: Text(
        buttonLabel,
        style: new TextStyle(
            color: textColor, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
    return loginBtn;
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: _onBackPressed,
        child: new Scaffold(
            appBar: new AppBar(
              // leading: new Icon(Icons.home),

              title: new Text("BERANDA"),
              backgroundColor: Colors.lightBlueAccent[100],
            ),
            drawer: new Drawer(
              child: new ListView(
                children: <Widget>[
                  new Container(
                    child: new UserAccountsDrawerHeader(
                      accountName: new Text(data.nama),
                      accountEmail: new Text(data.username),
                      currentAccountPicture: GestureDetector(
                        onTap: () {
                          print(data.id_user);
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Akun(data.id_user,data.nama)));
                        },
                        child: new CircleAvatar(
                          backgroundImage: new AssetImage("img/avatar.jpg"),
                        ),
                      ),
                      decoration: new BoxDecoration(),
                    ),
                    color: Colors.lightBlueAccent[100],
                  ),
                  new ListTile(
                    title: new Text("Riwayat"),
                    trailing: new Icon(Icons.settings),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Histori(id_anak)));
                    },
                  ),
                  new ListTile(
                      title: new Text("Log Out"),
                      trailing: new Icon(Icons.close),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      }),
                ],
              ),
            ),
            body: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("img/bg2.jpg"),
                fit: BoxFit.cover,
              )),
              child: new ListView(
                children: <Widget>[
                  new Container(
                    height: 125.0,
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width * 1,
                    child: new Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage("img/avatar.jpg"),
                          // backgroundColor: Colors.purpleAccent[50],
                          radius: 40.0,
                        )
                      ],
                    ),
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
                                return Stunting();
                              }));
                            },
                            child: new Container(
                                child: Text(
                              "APA ITU STUNTING?",
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
                                return Deteksi(data.id_user);
                              }));
                            },
                            child: new Container(
                                child: Text(
                              "DETEKSI DINI",
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
                                return Penanganan();
                              }));
                            },
                            child: new Container(
                                child: Text(
                              "PENANGANAN",
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
            )));
  }
}
