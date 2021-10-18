import 'dart:convert';

import 'package:http/http.dart';
import 'package:tugas7_http_request/constants/const.dart';
import 'package:tugas7_http_request/model/article_data.dart';
import 'package:http/http.dart' as http;
import 'package:tugas7_http_request/model/reqres_login.dart';
import 'package:tugas7_http_request/model/search_data.dart';

class ApiClient {
  static Future<List> getData() async {
    Uri uri = Uri.parse('${Constant.baseUrl}wp/v2/posts');
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      for (int i = 0; i < jsonDecode(response.body).length; i++) {
        final datum = Article.fromJSON(jsonDecode(response.body)[i]);
        artikel.add(datum);
      }
      return artikel;
    } else {
      throw Exception('Failed to load Data');
    }
  }

  static Future<List<SearchData>> getResult(String query) async {
    Uri _uri = Uri.parse('${Constant.baseUrl}wp/v2/search');
    final response = await http.get(_uri);
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => SearchData.fromJson(json)).where((element) {
        final titleLower = element.title!.toLowerCase();
        final searchLower = query.toLowerCase();
        return titleLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception('Data Not Found!');
    }
  }
}

class LoginApi {
  static Future<ReqResLogin> getToken({
    required String email,
    required String password,
  }) async {
    Response _response = await http.post(
      Uri.parse("${Constant.baseUrl}jwt-auth/v1/token"),
      body: <String, dynamic>{
        'email': email,
        'password': password,
      },
    );
    return ReqResLogin.fromJson(_response.body);
  }
}
