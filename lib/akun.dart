import 'dart:io';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:stunting_apps/ortu.dart';
import 'package:stunting_apps/src/api_service.dart';
import 'package:intl/intl.dart';
import 'package:stunting_apps/src/model/anak.dart';
//import 'package:stunting_apps/src/model/profile.dart';
import 'package:image_picker/image_picker.dart';


class Akun extends StatefulWidget {
  String id_ortu;
  String nama_user;
  Akun(this.id_ortu,this.nama_user);
  

  @override
  _AkunState createState() => _AkunState(this.id_ortu,this.nama_user);
}



final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
class _AkunState extends State<Akun> {
  
  File imageFile;
  String id_ortu;
  String nama;
  String domisili;
  String pekerjaan;
  String username;
  String nama_user;
  _AkunState(this.id_ortu,this.nama_user);
  Anak anak;
ApiService _apiService = ApiService();
  String dropdownValue ;
  String dropdownValue2;
  String dropdownValue3;
  String curentDate ;
  String id_anak;

  _getImage()async{
  var image = await ImagePicker.pickImage(
    source: ImageSource.gallery,
    maxHeight: 1920.0,
    maxWidth: 1080.0
    
  );
  setState(() {
    imageFile = image; 
  });

  
  //return image;
}
 // String nama_user;
  //final data=_apiService.getProfileAnak(id_ortu.toString());
  @override

 
  void initState() {
    print(id_ortu);
   // ApiService _apiService = ApiService();
   final dataAnak = _apiService.getProfileAnak(id_ortu);
   // super.initState();
    
    dataAnak.then((value){
        Anak anak = value.single;
       
      setState(() {
        
        //imageFile = 
        
        id_anak=anak.id_anak;
      _isFieldHubValid = true;
      _controllerHub.text=anak.hubungan.toString();
      dropdownValue = anak.hubungan.toString();
      
     
      _isFieldNamaValid = true;
      _controllerNama.text = anak.nama_anak;
      print(_controllerNama.text);
      _isFieldJenKelValid = true;
      dropdownValue2 = anak.jenis_kelamin.toString();
      _controllerJenKel.text=anak.jenis_kelamin.toString();
      _isFieldTtlValid = true;
     _controllerTtl.text = anak.tanggal_lahir;
      _isFieldRiwLahValid = true;
      _controllerRiwLah.text=anak.riwayat_kelahiran.toString();
      dropdownValue3 = anak.riwayat_kelahiran.toString();

      //nama_user = anak.nama_user.toString();
       print(nama_user);
       nama=anak.nama_user;
       pekerjaan=anak.pekerjaan;
       domisili=anak.domisili;
       username=anak.username;
       //id_ortu=anak.id_user;
      }
      
      );
      
      print(domisili);
      
      
    });
    
    
    super.initState();
    

  }

  //final format = DateFormat("yyyy-MM-dd");
  bool _isLoading = false;
  
  // bool _isFieldIdValid;
  bool _isFieldHubValid;
  bool _isFieldNamaValid;
  bool _isFieldJenKelValid;
  bool _isFieldTtlValid;
  bool _isFieldRiwLahValid;

  TextEditingController _controllerHub = TextEditingController();
  TextEditingController _controllerNama = TextEditingController();
  TextEditingController _controllerJenKel = TextEditingController();
  TextEditingController _controllerTtl = TextEditingController();
  TextEditingController _controllerRiwLah = TextEditingController();

  final format = DateFormat("yyyy-MM-dd");
  DateTime date;
  TimeOfDay time;
  List<Widget> containers = [
    
    
  ];


  @override
  Widget build(BuildContext context) {
    //var placeholder = 
     return Scaffold(
     appBar: new AppBar(
       // leading: new Icon(Icons.home),
      // key: _scaffoldState,
       title: new Text("PROFIL AKUN"),
       backgroundColor: Colors.lightBlueAccent[100],
       
     ),
     body: Container(
       decoration: BoxDecoration(
       image: DecorationImage(
           image: AssetImage("img/bg2.jpg"), fit: BoxFit.fill)),
       child: new ListView(children: <Widget>[
     Container(
       padding: EdgeInsets.all(20),
       child: Column(
         children: <Widget>[
           new Container(
             height: 125.0,
             padding: EdgeInsets.all(20),
             width: MediaQuery.of(context).size.width * 1,
             child: new Column(
               children: <Widget>[
                 InkWell(
                   onTap: (){
                     _getImage();
                   },
                    child: CircleAvatar(
                     backgroundImage: imageFile == null ?  AssetImage("img/avatar.jpg"):FileImage(imageFile),
                     // backgroundColor: Colors.purpleAccent[50],
                     //child: ,
                     radius: 40.0,
                   ),
                 )
               ],
             ),
           ),
           Row(
             children: <Widget>[
               Container(
                 padding: EdgeInsets.all(10),
                 child: Text("Hubungan dengan Anak : "),
               )
             ],
           ),
           Row(
             children: <Widget>[
               Container(
                 margin: EdgeInsets.all(10),
                 width: 250,
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
                 child: Text("Nama Anak : "),
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
             ),
           ),
           Row(
             children: <Widget>[
               Container(
                 padding: EdgeInsets.all(10),
                 child: Text("Jenis Kelamin : "),
               ),
             ],
           ),
           Row(
             children: <Widget>[
               Container(
                 margin: EdgeInsets.all(10),
                 width: 250,
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
                       },
                       items: <String>[
                         'Laki-laki',
                         'Perempuan',
                       ].map<DropdownMenuItem<String>>(
                           (String value2) {
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
                width: 250,
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
                         bool isFieldValid =
                             newValue.trim().isNotEmpty;
                         if (isFieldValid != _isFieldRiwLahValid) {
                           setState(() =>
                               _isFieldRiwLahValid = isFieldValid);
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
       padding: EdgeInsets.all(10),
             child: Text("ORANG TUA",
                 style: TextStyle(fontWeight: FontWeight.bold)),
     ),
     Row(children: <Widget>[
       Container(
         margin: EdgeInsets.all(10),
         child: CircleAvatar(backgroundImage: AssetImage("img/avatar.jpg"),
                 // backgroundColor: Colors.purpleAccent[50],
                 radius: 20.0,),
       ),
       Container(padding: EdgeInsets.only(left: 10),
         child: GestureDetector(
           child: Text(
             nama_user,
                   style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold)),
                   onTap: (){
                     Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => Ortu(username)),
             );
                   },
         ),
       )
     ],),
           Row(children: <Widget>[
             Container(
               child: RaisedButton(
                 child: Text('Update Data'),
                 onPressed: (){
                   //String idOrtu = id_ortu;
                   Anak anak = Anak(
                     id_user: id_ortu,
                     id_anak: id_anak,
                     hubungan: dropdownValue,
                     nama_anak: _controllerNama.text,
                     jenis_kelamin: dropdownValue2,
                     tanggal_lahir: _controllerTtl.text,
                     riwayat_kelahiran: dropdownValue3

                   );

                   
  _apiService.updateAnak(anak).then((isSuccess) {
    setState(() => _isLoading = false);
    if (isSuccess) {
        Navigator.pop(_scaffoldState.currentState.context);
    } else {
        _scaffoldState.currentState.showSnackBar(SnackBar(
      content: Text("Update data failed"),
        ));
        print("Gagal input data");
        return;
    }
  });
                 },
                 ),
             )
           ],)
         ],
       ),
     )
       ]),),);
    

  }
 
}
