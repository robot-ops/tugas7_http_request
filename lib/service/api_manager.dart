import 'dart:convert';

import 'package:tugas7_http_request/constants/const.dart';
import 'package:tugas7_http_request/model/article_data.dart';
import 'package:http/http.dart' as http;
import 'package:tugas7_http_request/model/reqres_login.dart';

class ApiClient {
  static Future<Artikelmodel> getData() async {
    final String url = "https://gits-msib.my.id/wp-json/wp/v2/posts";
    var artikelMod;

    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      artikelMod = Artikelmodel.fromJson(jsonMap);
    } else {
      throw Exception('Failed to Load Data');
    }
    return artikelMod;
  }
}

class ApiClients {
  static Future<ReqResLogin> getToken({
    required String email,
    required String password,
  }) async {
    http.Response _response = await http.post(
      Uri.https(Constant.baseDomain, '/api/login'),
      body: <String, dynamic>{
        'email': email,
        'password': password,
      },
    );
    return ReqResLogin.fromJson(_response.body);
  }
}
