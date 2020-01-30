//import 'package:stunting_apps/Model/Pengguna.dart' as prefix0;
//mport 'package:stunting_apps/src/model/pengguna.dart';
import 'dart:convert';
import 'dart:io';

import 'package:stunting_apps/src/model/dtanak.dart';
import 'package:stunting_apps/src/model/profile.dart';
import 'package:stunting_apps/src/model/anak.dart';
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String baseUrl = "http://surkum.xyz/";
  Client client = Client();
  var status;
  String username;
  String password;
  var token;

  Future<List<Pengguna>> login(Pengguna data) async {
    final response = await client
        .get("$baseUrl/api/pengguna/${data.username}/${data.password}");
    if (response.body.isNotEmpty) {
      return penggunaFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<Pengguna> getProfiles(String username) async {
    final response = await client.get("$baseUrl/api/pengguna/${username}");
    if (response.body.isNotEmpty) {
      return penggunaFromJson2(response.body);
    } else {
      return null;
    }
  }

  Future<List<Dtanak>> getData(String id_anak) async {
    final response = await client.get("$baseUrl/api/dtanak/${id_anak}");
    if (response.body.isNotEmpty) {
      return dtanakFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> findPengguna(Pengguna data) async {
    final response = await client.get("$baseUrl/api/pengguna/${data.username}");
    if (response.body.isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> createPengguna(Pengguna data) async {
    final response = await client.post(
      "$baseUrl/api/pengguna",
      headers: {"content-type": "application/json"},
      body: penggunaToJson(data),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createData(Dtanak data) async {
    final response = await client.post(
      "$baseUrl/api/dtanak",
      headers: {"content-type": "application/json"},
      body: dtanakToJson(data),
    );
    if (response.statusCode > 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setPass(String id, String pass) async {
    final response = await client.put("$baseUrl/api/pengguna/${id}/${pass}");
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateAnak(Anak data) async {
    final response = await client.put(
      "$baseUrl/api/anak",
      headers: {"content-type": "application/json"},
      body: anakToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Anak>> getProfileAnak(String id_ortu) async {
    final response = await client.get("$baseUrl/api/anak/${id_ortu}");
    if (response.body.isNotEmpty) {
      return anakFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createAnak(Anak data) async {
    final response = await client.post(
      "$baseUrl/api/anak",
      headers: {"content-type": "application/json"},
      body: anakToJson(data),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }
}
