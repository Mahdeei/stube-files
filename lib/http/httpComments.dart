import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stubbbb/Models/Comment.dart';
import 'package:stubbbb/Models/Profile.dart';


class HttpComments{
  static var url_getComment = 'http://192.168.1.4/Stub/GetComments.php';
  static var url_getUsername = 'http://192.168.1.4/Stub/getUsernameComments.php';
  static var url_sendComment = 'http://192.168.1.4/Stub/SendComments.php';

  static Future<Map>  getComments(var user_id) async {
    List<Comment> comments=[];
    List<Profile> profile=[];

    var response = await http.post(url_getComment,body: {
      "user_id":"$user_id"
    });
    

    var responseBody = json.decode(response.body);
    responseBody.forEach((item) async {
      comments.add(Comment.fromJson(item));
    });
    return {'comments':comments};
  }
  
  static Future<List> getUsername(var user_id) async {
    print(user_id);
    List usrnames = [];
    var response = await http.post(url_getUsername,body: {"user_id":user_id});
    var responsebody = json.decode(response.body);
    responsebody.forEach((item){
      usrnames.add(item );
    });
    return usrnames;

  }


  static Future<Map> sendComment(Map body)async{

    var response = await http.post(url_sendComment,body: body);
    var responseBody = json.decode(response.body);
  }


}