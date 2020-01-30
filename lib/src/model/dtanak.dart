import 'dart:convert';

import 'dart:ffi';

class Dtanak {
  String id_anak;
  var berat;
  String bblr;
  String prematur;
  String date;
  

  Dtanak(
      {
      this.id_anak,
      this.berat,
      this.bblr,
      this.prematur,
      this.date
      });

  factory Dtanak.fromJson(Map<String, dynamic> map) {
    return Dtanak(
        
        id_anak: map['id_anak'],
        berat: map['berat'],
        bblr: map['bblr'],
        prematur: map['prematur'],
        date: map['created_at']
        );
  }

  Map<String, dynamic> toJson() {
    return {
      
      "id_anak": id_anak,
      "berat": berat,
      "bblr": bblr,
      "prematur": prematur,
      
    };
  }

  @override
  String toString() {
    return 'Dtanak{ id_anak: $id_anak, berat: $berat, bblr: $bblr, prematur: $prematur,date: $date}';
  }
}

List<Dtanak> dtanakFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Dtanak>.from(data.map((item) => Dtanak.fromJson(item)));
}

String dtanakToJson(Dtanak data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
