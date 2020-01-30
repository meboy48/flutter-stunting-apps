
import 'package:flutter/material.dart';
import 'package:stunting_apps/anakdaftar.dart';
import 'package:stunting_apps/src/api_service.dart';
import 'package:stunting_apps/src/model/profile.dart';
//import 'package:uuid/uuid.dart';
import 'package:better_uuid/uuid.dart';

Uuid uid = Uuid.v4();

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class DaftarBaru extends StatefulWidget {
  @override
  _DaftarBaruState createState() => _DaftarBaruState();
}

class _DaftarBaruState extends State<DaftarBaru> {
  ApiService _apiService = ApiService();
  // bool _isFieldIdValid;
  bool _isFieldNameValid;
  bool _isFieldWorkValid;
  bool _isFieldAddrValid;
  bool _isFieldUnameValid;
  bool _isFieldPassValid;
  bool _isFieldPass2Valid;

  //TextEditingController _controllerId = TextEditingController();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerWork = TextEditingController();
  TextEditingController _controllerAddr = TextEditingController();
  TextEditingController _controllerUname = TextEditingController();
  TextEditingController _controllerPass = TextEditingController();
  TextEditingController _controllerPass2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        //iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Form User Baru",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/gradient_1.png"),
                fit: BoxFit.cover)),
              child: new ListView(padding: const EdgeInsets.all(16.0), children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  //_buildTextFieldId(),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: _buildTextFieldName(),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: _buildTextFieldWork(),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: _buildTextFieldAddr(),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: _buildTextFieldUname(),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: _buildTextFieldPass(),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: _buildTextFieldPass2(),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: RaisedButton(
                      onPressed: () {
                        if (
                            //_isFieldIdValid == null ||
                            _isFieldNameValid == null ||
                                _isFieldWorkValid == null ||
                                _isFieldAddrValid == null ||
                                _isFieldUnameValid == null ||
                                _isFieldPassValid == null ||

                                //!_isFieldIdValid ||
                                !_isFieldNameValid ||
                                !_isFieldWorkValid ||
                                !_isFieldAddrValid ||
                                !_isFieldUnameValid ||
                                !_isFieldPassValid) {
                          _scaffoldState.currentState.showSnackBar(
                            SnackBar(
                              content: Text("Mohon isi seluruh data"),
                            ),
                          );
                          return;
                        }
                        String idUser = uid.toString();
                        String name = _controllerName.text.toString();
                        String pekerjaan = _controllerWork.text.toString();
                        String domisili = _controllerAddr.text.toString();
                        String username = _controllerUname.text.toString();
                        String password = _controllerPass.text.toString();

                        Pengguna profile = Pengguna(
                            id_user: idUser,
                            nama: name,
                            pekerjaan: pekerjaan,
                            domisili: domisili,
                            username: username,
                            password: password);
                        _apiService.findPengguna(profile).then((isSuccess) {
                          if (!isSuccess) {
                            //_controllerUname.clear();
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Username sudah ada"),
                            ));
                            return;
                          } else {
                            _apiService.createPengguna(profile).then((isSuccess) {
                              if (!isSuccess) {
                                
                                 Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DaftarAnakBaru(
                                            ortuID: uid.toString(),
                                          )),
                                );
                                
                              } else {
                               

                                 _scaffoldState.currentState.showSnackBar(SnackBar(
                                  content: Text("Submit data berhasil"),
                                ));
                               return;
                              }
                            });
                          }
                        });
                      },
                      child: Text(
                        "Lanjut".toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.blue,
                      
                    ),
                  )
                ],
              ),
            ]),
      ),
    );
       
    
  }

  Widget _buildTextFieldName() {
    return TextField(
      controller: _controllerName,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: "Nama Lengkap",
        prefixIcon: Icon(Icons.person, color: Color(0xFF000000)),
        focusColor: Colors.black,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.black, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10)),
        errorText: _isFieldNameValid == null || _isFieldNameValid
            ? null
            : "Data dibutuhkan",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldNameValid) {
          setState(() => _isFieldNameValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldWork() {
    return TextField(
      controller: _controllerWork,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Pekerjaan",
        prefixIcon: Icon(Icons.business_center, color: Color(0xFF000000)),
        focusColor: Colors.black,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.black, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10)),
        errorText: _isFieldWorkValid == null || _isFieldWorkValid
            ? null
            : "Data dibutuhkan",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldWorkValid) {
          setState(() => _isFieldWorkValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldAddr() {
    return TextField(
      controller: _controllerAddr,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.home, color: Color(0xFF000000)),
        focusColor: Colors.black,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.black, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10)),
        labelText: "Domisili",
        errorText: _isFieldAddrValid == null || _isFieldAddrValid
            ? null
            : "Data dibutuhkan",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldAddrValid) {
          setState(() => _isFieldAddrValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldUname() {
    return TextField(
      controller: _controllerUname,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.accessibility, color: Color(0xFF000000)),
        focusColor: Colors.black,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.black, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10)),
        labelText: "Username",
        errorText: _isFieldUnameValid == null || _isFieldUnameValid
            ? null
            : "Data dibutuhkan",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldUnameValid) {
          setState(() => _isFieldUnameValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldPass() {
    return TextField(
      obscureText: true,
      controller: _controllerPass,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.enhanced_encryption, color: Color(0xFF000000)),
        focusColor: Colors.black,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.black, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10)),
        labelText: "Password",
        errorText: _isFieldPassValid == null || _isFieldPassValid
            ? null
            : "Password harus lebih dari 5 karakter",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty && value.length > 5;
        if (isFieldValid != _isFieldPassValid) {
          setState(() => _isFieldPassValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldPass2() {
    return TextField(
      obscureText: true,
      controller: _controllerPass2,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.enhanced_encryption, color: Color(0xFF000000)),
        focusColor: Colors.black,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.black, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10)),
        labelText: "Ulangi Password",
        errorText: _isFieldPass2Valid == null || _isFieldPass2Valid
            ? null
            : "Password yang dimasukkan tidak sama",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty &&
            (_controllerPass.text == _controllerPass2.text);
        if (isFieldValid != _isFieldPass2Valid) {
          setState(() => _isFieldPass2Valid = isFieldValid);
        }
      },
    );
  }
}
