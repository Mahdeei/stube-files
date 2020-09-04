import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stubbbb/Models/AgahiModel.dart';


class HttpAdvertisings {
  static var url = 'http://192.168.1.5/Stub/Advertising.php';


  static Future<Map> getData() async {
    List<Advertising> advertisings = [];
    var response = await http.get(url);

    var responseBody = json.decode(response.body);
    print(responseBody);
    responseBody.forEach((item) {
      advertisings.add(Advertising.fromJson(item));
    });
    return {
      'advertisings' : advertisings
    };
  }
}

