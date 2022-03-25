import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiController {
  static Future getAssets() async {
    var url = Uri.parse('http://food.Mockable.io/v1/banner');
    var response = await http.get(url, headers: {
      'Accept': 'application/json',
    });
    var temps = response.body;
    Map<String, dynamic> result = jsonDecode(temps);
    return result;
  }
}
