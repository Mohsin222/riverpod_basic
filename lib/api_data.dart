import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:notes_app_with_river/notes_model.dart';


class HttpService {
 

 static Future<List<UserModel>> getPosts() async {
   final String postsURL = "https://jsonplaceholder.typicode.com/posts";
    final response = await http.get(Uri.parse(postsURL));

  var responseData = json.decode(response.body);

  if(response.statusCode ==200){


  return responseData;
  }
   
     else {
      throw "Unable to retrieve posts.";
    }
  }
}

class ApiData extends  StateNotifier<List<UserModel>>{


  ApiData() : super([]);
List<UserModel> alluserData =[];
apifetchData()async{
  var data =await HttpService.getPosts();

  for(var i in data){
alluserData.add(UserModel.fromMap(i as Map<String, dynamic>));
  }
}

}