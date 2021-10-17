import 'package:tugas7_http_request/constants/const.dart';
import 'package:tugas7_http_request/model/article_data.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static Future<List> getData() async {
    Uri uri = Uri.parse('${Constant.baseUrl}wp/v2/posts');
    http.Response response = await http.get(uri);
    return artikel;
  }
}
