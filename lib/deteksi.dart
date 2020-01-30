import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stunting_apps/hasil.dart';
import 'package:stunting_apps/src/api_service.dart';
import 'package:stunting_apps/src/model/anak.dart';
import 'package:stunting_apps/src/model/dtanak.dart';

class Deteksi extends StatefulWidget {
  String id_ortu;
  Deteksi(this.id_ortu);
  @override
  _DeteksiState createState() => _DeteksiState(this.id_ortu);
}
final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class _DeteksiState extends State<Deteksi> {
  String id_ortu;
  _DeteksiState(this.id_ortu);
  String _data = "";
  String _data1 = "";

  ApiService _apiService = ApiService();

  TextEditingController _controllerBerat = TextEditingController();
  void _dataku(String value) {
    setState(() {
      _data = value;
    });
  }

  void _dataku1(String value1) {
    setState(() {
      _data1 = value1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent[100],
          title: Text("DETEKSI DINI"),
          actions: <Widget>[
            Icon(Icons.chat_bubble),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("img/bg2.jpg",), fit: BoxFit.cover)
          ),
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
                      child: TextField(
                        controller: _controllerBerat,
                         keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            // prefixText: "Berat Badan : ",
                            labelText: "Berat Badan (kg)",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),

                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Text("Berat Badan Lahir Rendah?")),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Radio(
                            
                            value: "Ya",
                            groupValue: _data,
                            onChanged: (String value) {
                              _dataku(value);
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text("Ya")),
                        Radio(
                          value: "Tidak",
                          groupValue: _data,
                          onChanged: (String value) {
                            _dataku(value);
                          },
                        ),
                        Text("Tidak"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Text("Prematur?")),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Radio(
                            value: "Ya",
                            groupValue: _data1,
                            onChanged: (String value1) {
                              _dataku1(value1);
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text("Ya")),
                        Radio(
                          value: "Tidak",
                          groupValue: _data1,
                          onChanged: (String value1) {
                            _dataku1(value1);
                          },
                        ),
                        Text("Tidak"),
                      ],
                    ),
                    
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
                      child: RaisedButton.icon(
                        icon: Icon(Icons.thumb_up),
                        label: Text("Cek Hasil"),
                        onPressed: () {
                          
                          _apiService.getProfileAnak(id_ortu).then((value){
                            Anak anak = value.single;
                            var berat = double.parse(_controllerBerat.text);
                            String bblr = _data.toString();
                            String prematur = _data1.toString();
                             Dtanak data = Dtanak(id_anak: anak.id_anak,
                             berat: berat, bblr: bblr,prematur: prematur);
                          _apiService.createData(data).then((value){
                            if(value=true){
                              _scaffoldState.currentState.showSnackBar(
                              SnackBar(
                                content: Text("Berhasil input data"),
                              )
                              );

                            }else{
                              _scaffoldState.currentState.showSnackBar(
                              SnackBar(
                                content: Text("Gagal input data"),
                              )
                              );
                            }
                          });
                          });
                         
                          
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
