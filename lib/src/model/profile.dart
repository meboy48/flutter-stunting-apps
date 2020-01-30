import 'dart:convert';

import 'dart:io';

class Pengguna {
  String id_user;
  String nama;
  String pekerjaan;
  String domisili;
  String username;
  String password;
  File img;

  Pengguna({
    this.id_user,
    this.nama,
    this.pekerjaan,
    this.domisili,
    this.username,
    this.password,
    this.img});

  factory Pengguna.fromJson(Map<String, dynamic> map) {
    return Pengguna(
        id_user: map['id_user'], nama: map['nama'], pekerjaan: map['pekerjaan'], domisili: map['domisili'], username: map['username'], password: map['password'],img: map['image']);
  }

  Map<String, dynamic> toJson() {
    return {"id_user": id_user,
      "nama": nama,
      "pekerjaan": pekerjaan,
      "domisili": domisili,
      "username" : username,
      "password" : password,
      "image" : img,
      };
  }

  @override
  String toString() {
    return 'Pengguna{id_user: $id_user, nama: $nama, pekerjaan: $pekerjaan, domisili: $domisili, username: $username, password: $password, image: $img}';
  }

}

Pengguna penggunaAkun(String jsonData){
  final dataAkun = json.decode(jsonData);
  return Pengguna.fromJson(dataAkun);
}

List<Pengguna> penggunaFromJson(String jsonData) {
  final data = json.decode(jsonData);
    return List<Pengguna>.from(data.map((item)=>Pengguna.fromJson(item)));
}

Pengguna penggunaFromJson2(String jsonData){
  final data =json.decode(jsonData);
  return Pengguna.fromJson(data);
}

String penggunaToJson(Pengguna data) {
   final jsonData = data.toJson();
    return json.encode(jsonData);
}