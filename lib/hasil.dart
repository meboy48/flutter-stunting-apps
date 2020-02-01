import 'package:flutter/material.dart';
import 'dart:async';
//import 'package:http/http.dart' as http;

class Hasil extends StatefulWidget {
  @override
  _HasilState createState() => _HasilState();
}

class _HasilState extends State<Hasil> {
  Future<List> getData() async {
 //   final response = await http.get("http://10.0.2.2/stunting_apps/getdata.php");
    //return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Coba"),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot){
          if(snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
          ? new ItemList(list: snapshot.data,) : new Center(child:  new CircularProgressIndicator(),);
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list}); 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list==null ? 0 : list.length,
      itemBuilder: (context, i){
        return ListTile(
          title: Text(list[i]['item_name']),
          leading: Icon(Icons.widgets),
          subtitle: Text("Stock : ${list[i]['stock']}"),
          );
      },
    );
  }
}