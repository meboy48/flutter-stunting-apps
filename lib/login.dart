import 'package:flutter/material.dart';
import 'package:stunting_apps/beranda.dart';
//import 'package:stunting_apps/depanbaru.dart';
import 'package:stunting_apps/src/api_service.dart';
import 'package:stunting_apps/daftarbaru.dart';
import 'package:stunting_apps/src/model/profile.dart';
import 'package:loading_animations/loading_animations.dart';

class Login extends StatefulWidget {
  // Login() : super(key: key);
  //final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  ApiService _apiService = ApiService();
  // bool _isFieldIdValid;
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  _showSnackBar(String text) {
    final snackBar = new SnackBar(
      content: new Text(text),
    );
    _scaffoldState.currentState.showSnackBar(snackBar);
  }

  final TextEditingController _unameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String msg = '';
  @override
  //initState() {
  //read();
  //}

  // ApiService _apiService = new ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldState,
        //appBar: new AppBar(
        //title: Text("STUNTING APPS"),
        //backgroundColor: Colors.pink[300],
        //),
        //  backgroundColor: Colors.blueAccent[100],
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/gradient_1.png"),
                  fit: BoxFit.cover)),
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: <Widget>[
              new Container(
                // color: Colors.pinkAccent[50],
                // margin: EdgeInsets.all(50.0),
                child: new Column(
                  children: <Widget>[
                    Container(
                      width: 200,
                      height: 200,
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
                      child: Image.asset('assets/images/logo12.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextField(
                        controller: _unameController,
                        decoration: InputDecoration(
                            fillColor: Colors.black,
                            focusColor: Colors.black,

                            // icon: Icon(
                            // Icons.assignment_ind,
                            // color: Color(0xFF000000),
                            // ),
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                            hintText: "Username"),
                        textAlign: TextAlign.left,
                        // textInputAction: TextInputAction.continueAction,
                      ),
                    ),
                    new SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            // icon: Icon(
                            // Icons.enhanced_encryption,
                            // color: Color(0xFF000000),
                            // ),
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                            hintText: "Password"),
                        obscureText: true,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.fromLTRB(0, 30, 0, 40),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text("Belum punya akun?",
                                  style: TextStyle(
                                      fontFamily: 'JosefinSans', fontSize: 15)),
                            ),
                            GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 3),
                                child: Text("DAFTAR DI SINI",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'JosefinSans',
                                        fontSize: 15)),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DaftarBaru()),
                                );
                              },
                            )
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: RaisedButton(
                          padding: const EdgeInsets.all(8.0),
                          textColor: Colors.white,
                          color: Colors.blue,
                          child: new Text("Masuk"),
                          onPressed: () {
                            Pengguna profile = Pengguna(
                                username: _unameController.text.toString(),
                                password: _passwordController.text.toString());

                            //final response = _apiService.login(profile);
                            if (_unameController.text.trim().isNotEmpty &&
                                _passwordController.text.trim().isNotEmpty) {
                              //  setState(() => _isLoading = true);

                              _apiService.login(profile).then((value) {
                                // print(value);

                                Pengguna profiles = value.single;
                                // print(profiles.nama);
                                //var dataPeng = _apiService.login(profile);
                                if (profiles.username !=
                                    _unameController.text.toString()) {
                                  _showSnackBar("username tidak ditemukan");
                                  //print(profiles);
                                } else {
                                  Navigator.of(context)
                                      .pushReplacement(new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new Beranda(data: profiles),
                                  ));
                                }
                              });
                            } else {
                              _showSnackBar(
                                  "username dan password harus diisi");
                            }
                          },
                        ))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
