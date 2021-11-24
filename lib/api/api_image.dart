import 'dart:convert';

import 'data.dart';
import 'package:http/http.dart' as http;

class ApiImage{
  static Future<Data> fetchData(String query, int page) async {
    Uri url = Uri.parse('https://unsplash.com/napi/search/photos?query=$query&xp=&per_page=50&page=$page');
    var response = await http.get(url);
    var jsonData = json.decode(response.body);
    var data = Data.fromJson(jsonData);
    return data;
  }
//&orientation=portrait
}