import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:stunting_apps/ortu.dart';
import 'package:stunting_apps/src/api_service.dart';

class Password extends StatefulWidget {
  @override
  String pass;
  String id;
  Password(this.id,this.pass);
  _PasswordState createState() => _PasswordState(this.id,this.pass);
}
final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
class _PasswordState extends State<Password> {
  @override
  String id;
  String pass;
  _PasswordState(this.id,this.pass);

  ApiService _apiService=ApiService();  

  TextEditingController _controllerPassLama=TextEditingController();
  TextEditingController _controllerPassBaru=TextEditingController();
  TextEditingController _controllerPassBaru2=TextEditingController();

  void showSimpleFlushbar(BuildContext context) {
    Flushbar(
      // There is also a messageText property for when you want to
      // use a Text widget and not just a simple String
      message: 'Hello from a Flushbar',
      // Even the button can be styled to your heart's content
      mainButton: FlatButton(
        child: Text(
          'Click Me',
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        onPressed: () {},
      ),
      duration: Duration(seconds: 3),
      // Show it with a cascading operator
    )..show(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GANTI PASSWORD"),
        backgroundColor: Colors.lightBlueAccent[100],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("img/bg2.jpg"), fit: BoxFit.fill)
        ),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                        child: Text("GANTI PASSWORD",
                            style: TextStyle(fontWeight: FontWeight.bold, backgroundColor: Colors.transparent, shadows: [
                                    Shadow(
                                        color: Colors.lightBlue,
                                        offset: Offset(1, 2),
                                        blurRadius: 2)
                                  ])),
                ),
              Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text("Password Lama : "),
                      )
                    ],
                  ),
                   Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: _controllerPassLama,
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
                        child: Text("Password Baru : "),
                      )
                    ],
                  ),
                   Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: _controllerPassBaru,
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
                        child: Text("Konfirmasi Password Baru : "),
                      )
                    ],
                  ),
                   Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: _controllerPassBaru2,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.accessibility_new),
                          // prefixText: "Tinggi Badan : ",
                          // labelText: "",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.blue,
                child: new Text("Simpan"),
                onPressed: () {
                  if(_controllerPassLama.text!=pass){
                    print("password salah");
                    return;
                  }else if(_controllerPassBaru.text!=_controllerPassBaru2.text){
                    print("password tidak sama");
                    return;
                  }else{
                    _apiService.setPass(this.id, _controllerPassBaru.text).then((isSuccess) {
    //setState(() => _isLoading = false);
    if (isSuccess) {
      print("sukses");
        showSimpleFlushbar(context);
    } else {
        _scaffoldState.currentState.showSnackBar(SnackBar(
      content: Text("Update data failed"),
        ));
        print("Gagal input data");
        return;
    }
  });
                  }
                    
                  
                  // Navigator.pushReplacement(context,
                  //                 MaterialPageRoute(builder: (context) {
                  //             //  return Ortu();
                  //             }));
                },
              ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}