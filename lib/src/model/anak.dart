import 'dart:convert';

class Anak {
  String id_user;
  String nama_user;
  String pekerjaan;
  String domisili;
  String username;
  String id_anak;
  String hubungan;
  String nama_anak;
  String jenis_kelamin;
  String tanggal_lahir;
  String riwayat_kelahiran;

  Anak(
      {this.id_user,
      this.nama_user,
      this.pekerjaan,
      this.domisili,
      this.username,
      this.id_anak,
      this.hubungan,
      this.nama_anak,
      this.jenis_kelamin,
      this.tanggal_lahir,
      this.riwayat_kelahiran});

  factory Anak.fromJson(Map<String, dynamic> map) {
    return Anak(
        id_user: map['id_user'],
        nama_user: map['nama_user'],
        pekerjaan: map['pekerjaan'],
        domisili: map['domisili'],
        username: map['username'],
        id_anak: map['id_anak'],
        hubungan: map['hubungan'],
        nama_anak: map['nama_anak'],
        jenis_kelamin: map['jenis_kelamin'],
        tanggal_lahir: map['tanggal_lahir'],
        riwayat_kelahiran: map['riwayat_kelahiran']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id_ortu": id_user,
      "nama_user": nama_user,
      "pekerjaan": pekerjaan,
      "domisili": domisili,
      "username": username,
      "id_anak": id_anak,
      "hubungan": hubungan,
      "nama_anak": nama_anak,
      "jenis_kelamin": jenis_kelamin,
      "tanggal_lahir": tanggal_lahir,
      "riwayat_kelahiran": riwayat_kelahiran,
    };
  }

  @override
  String toString() {
    return 'Anak{id_user: $id_user,nama_user: $nama_user,pekerjaan: $pekerjaan,domisili: $domisili,username: $username, id_anak: $id_anak, hubungan: $hubungan, nama_anak: $nama_anak, jenis_kelamin: $jenis_kelamin, tanggal_lahir: $tanggal_lahir, riwayat_kelahiran: $riwayat_kelahiran}';
  }
}

List<Anak> anakFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Anak>.from(data.map((item) => Anak.fromJson(item)));
}

String anakToJson(Anak data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
