import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:stunting_apps/login.dart';
import 'package:stunting_apps/password.dart';
import 'package:stunting_apps/src/api_service.dart';
import 'package:stunting_apps/src/model/profile.dart';

class Ortu extends StatefulWidget {
  String uname;
  Ortu(this.uname);
  final format = DateFormat("yyyy-MM-dd");
  @override
  _OrtuState createState() => _OrtuState(this.uname);
}

TextEditingController _controllerNama = TextEditingController();
  TextEditingController _controllerPekerjaan = TextEditingController();
  TextEditingController _controllerDomisili = TextEditingController();
  TextEditingController _controllerUsername = TextEditingController();
  //TextEditingController _controllerRiwLah = TextEditingController();


class _OrtuState extends State<Ortu> {
  String uname;
  String pass;
  _OrtuState(this.uname);
  final format = DateFormat("yyyy-MM-dd");
  DateTime date;
  TimeOfDay time;
  ApiService _apiService=ApiService();
  @override  
  void initState(){
    final data = _apiService.getProfiles(uname);
    super.initState();
    data.then((value){
      Pengguna ortu = value;

    
    setState(() {
       _controllerNama.text=ortu.nama;
       _controllerDomisili.text=ortu.domisili;
       _controllerPekerjaan.text=ortu.pekerjaan;
       _controllerUsername.text=ortu.username;
       pass=ortu.password;
    });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        // leading: new Icon(Icons.home),

        title: new Text("DATA ORANG TUA"),
        backgroundColor: Colors.lightBlueAccent[100],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("img/bg2.jpg"), fit: BoxFit.fill)),
        child: new ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text("DATA ORANG TUA",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
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
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text("Nama Orang Tua : "),
                      )
                    ],
                  ),
                   Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: _controllerNama,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.accessibility_new),
                          // prefixText: "Tinggi Badan : ",
                          // labelText: "",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text("Username : "),
                      )
                    ],
                  ),
                   Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: _controllerUsername,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.accessibility_new),
                          // prefixText: "Tinggi Badan : ",
                          // labelText: "",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text("Pekerjaan : "),
                      )
                    ],
                  ),
                   Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: _controllerPekerjaan,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.work),
                          // prefixText: "Tinggi Badan : ",
                          // labelText: "",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text("Domisili : "),
                      )
                    ],
                  ),
                   Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: _controllerDomisili,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.home),
                          // prefixText: "Tinggi Badan : ",
                          // labelText: "",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text("Tanggal Lahir : "),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: DateTimeField(
                      format: format,
                      onShowPicker: (context, currentValue) {
                        return showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100));
                      },
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(child: Text("GANTI PASSWORD",style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold) ),
                        onTap: (){
                                Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Password(this.uname,this.pass)),
                        );
                              },)
                      ),
                    ],
                  ),
                  Container(
                    child: RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.blue,
                child: new Text("Keluar"),
                onPressed: () {
                  Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return Login();
                              }));
                },
              ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
