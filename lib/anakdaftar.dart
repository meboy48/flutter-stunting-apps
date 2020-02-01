import 'package:better_uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:stunting_apps/login.dart';
import 'package:stunting_apps/src/api_service.dart';
import 'package:stunting_apps/src/model/anak.dart';
//import 'package:stunting_apps/src/model/profile.dart';

//String dropdownValue = 'Anak';
Uuid uid = Uuid.v4();

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class DaftarAnakBaru extends StatefulWidget {
  final String ortuID;
  final format = DateFormat("yyyy-MM-dd");

  DaftarAnakBaru({@required this.ortuID});

  @override
  _DaftarAnakBaruState createState() => _DaftarAnakBaruState(ortuID: ortuID);
}

class _DaftarAnakBaruState extends State<DaftarAnakBaru> {
  //final dateFormat = DateFormat("EEEE, MMMM d, yyyy 'at' h:mma");
  //final timeFormat = DateFormat("h:mm a");
  final String ortuID;
  _DaftarAnakBaruState({@required this.ortuID});

  ApiService _apiService = ApiService();
  // bool _isFieldIdValid;
  bool _isFieldHubValid;
  bool _isFieldNamaValid;
  bool _isFieldJenKelValid;
  bool _isFieldTtlValid;
  bool _isFieldRiwLahValid;

  //TextEditingController _controllerId = TextEditingController();
  TextEditingController _controllerNama = TextEditingController();
  TextEditingController _controllerTtl = TextEditingController();

  final format = DateFormat("yyyy-MM-dd");
  DateTime date;
  TimeOfDay time;
  String dropdownValue = 'Ibu';
  String dropdownValue2 = 'Laki-laki';
  String dropdownValue3 = 'Normal';
  String curentDate = '01-01-2001';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldState,
        appBar: new AppBar(
          // leading: new Icon(Icons.home),

          title: new Text(
            "FORM ANAK",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.blueAccent[100],
        body: new ListView(children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  child: Text("Hubungan dengan Anak : ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 300,
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                              bool isFieldValid = newValue.trim().isNotEmpty;
                              if (isFieldValid != _isFieldHubValid) {
                                setState(() => _isFieldHubValid = isFieldValid);
                              }
                            },
                            items: <String>[
                              'Ibu',
                              'Ayah',
                              'Kakek',
                              'Nenek',
                              'Sepupu',
                              'Pengasuh',
                              'Ibu Tiri',
                              'Ayah Tiri',
                              'Paman',
                              'Bibi',
                              'Anggota Keluarga Lain'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Nama Anak : ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _controllerNama,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.accessibility_new),
                        // prefixText: "Tinggi Badan : ",
                        labelText: "Nama Anak",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onChanged: (value) {
                      bool isFieldValid = value.trim().isNotEmpty;
                      if (isFieldValid != _isFieldNamaValid) {
                        setState(() => _isFieldNamaValid = isFieldValid);
                      }
                    },
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text("Jenis Kelamin : ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 300,
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton<String>(
                            value: dropdownValue2,
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String newValue2) {
                              setState(() {
                                dropdownValue2 = newValue2;
                              });
                              bool isFieldValid = newValue2.trim().isNotEmpty;
                              if (isFieldValid != _isFieldJenKelValid) {
                                setState(
                                    () => _isFieldJenKelValid = isFieldValid);
                              }
                            },
                            items: <String>[
                              'Laki-laki',
                              'Perempuan',
                            ].map<DropdownMenuItem<String>>((String value2) {
                              return DropdownMenuItem<String>(
                                value: value2,
                                child: Text(value2),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text("Tanggal Lahir : ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                //Text('Basic date field (${format.pattern})'),
                Container(
                  padding: EdgeInsets.all(10),
                  child: DateTimeField(
                    onChanged: (DateTime newDate) {
                      String dateVal = newDate.toString();
                      bool isFieldValid = dateVal.isNotEmpty;
                      if (isFieldValid != _isFieldTtlValid) {
                        setState(() => _isFieldTtlValid = isFieldValid);
                      }
                    },
                    controller: _controllerTtl,
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
                      //alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(10),
                      child: Text("Riwayat Kelahiran : ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),

                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 300,
                      child: DropdownButtonHideUnderline(
                        
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton<String>(
                            
                            value: dropdownValue3,
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue3 = newValue;
                              });
                              bool isFieldValid = newValue.trim().isNotEmpty;
                              if (isFieldValid != _isFieldRiwLahValid) {
                                setState(
                                    () => _isFieldRiwLahValid = isFieldValid);
                              }
                            },
                          
                            items: <String>[
                              'Normal',
                              'Premature',
                              'Berat badan lahir rendah (BBLR)',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: RaisedButton(
                      padding: const EdgeInsets.all(8.0),
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: new Text("Simpan"),
                      onPressed: () {
                        if (
                            //_isFieldIdValid == null ||
                                dropdownValue == null ||
                                _isFieldNamaValid == null ||
                                dropdownValue2 == null ||
                                _isFieldTtlValid == null ||
                                dropdownValue3 == null 

                                //!_isFieldIdValid ||
                                
                               // !_isFieldNamaValid ||
                               
                                //!_isFieldTtlValid 
                                ) {
                          _scaffoldState.currentState.showSnackBar(
                            SnackBar(
                              content: Text("Mohon isi seluruh data"),
                            ),
                          );
                          return;
                        } else {
                          String idOrtu = ortuID;
                        String idAnak = uid.toString();
                        String hub = dropdownValue.toString();
                        String nama = _controllerNama.text.toString();
                        String jenKel = dropdownValue2.toString();
                        String ttl = _controllerTtl.text.toString();
                        String riwayat = dropdownValue3.toString();
                        Anak profileAnak = Anak(
                          id_user: idOrtu,
                          id_anak: idAnak,
                          hubungan: hub,
                          nama_anak: nama,
                          jenis_kelamin: jenKel,
                          tanggal_lahir: ttl,
                          riwayat_kelahiran: riwayat,
                        );
                        _apiService.createAnak(profileAnak).then((isSuccess) {
                          if (!isSuccess) {
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Submit data berhasil"),
                            ));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ));
                          } else {
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Submit data failed"),
                            ));
                          }
                        });
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        }


                        
                      }),
                )
              ],
            ),
          ),
        ]));
  }
}
