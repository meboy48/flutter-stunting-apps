import 'package:flutter/material.dart';
import 'package:stunting_apps/src/api_service.dart';
import 'package:stunting_apps/src/model/dtanak.dart';

class Histori extends StatefulWidget {
  String id_anak;
  Histori(this.id_anak);
  @override
  _HistoriState createState() => _HistoriState(this.id_anak);
}

class _HistoriState extends State<Histori> {
  String id_anak;
  _HistoriState(this.id_anak);
   ApiService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: apiService.getData(id_anak),
        builder: (BuildContext context, AsyncSnapshot<List<Dtanak>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if(snapshot.data.isNotEmpty){
            List<Dtanak> profiles = snapshot.data;
            return _buildListView(profiles);
            }
            else{
              return _kosong();
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _kosong(){
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat input'),
        backgroundColor: Colors.blueAccent[100],
      ),
      body: Container(
        decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("img/bg2.jpg"),
                fit: BoxFit.cover,
              )),
              child: Center(
                child: Text("Belum ada data yang diinputkan"),
              ),
      ),
    );
  }

  Widget _buildListView(List<Dtanak> datas) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat input'),
        backgroundColor: Colors.blueAccent[100],
      ),
      body: Container(
        decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("img/bg2.jpg"),
                fit: BoxFit.cover,
              )),
              child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      
      child: ListView.builder(
        itemBuilder: (context, index) {
          Dtanak data = datas[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Tanggal : ${data.date}'),
                    Text(
                      'Berat badan : ${data.berat.toString()} kg',
                      style: Theme.of(context).textTheme.title,
                    ),
                    Text('BBLR : ${data.bblr.toString()}'),
                    Text('Lahir Prematur : ${data.prematur.toString()}'),
                    
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: datas.length,
      ),
    ) ,
      ),
       
    );
    
  }
}

 
  