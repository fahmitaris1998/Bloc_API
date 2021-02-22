import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;
import 'package:flutter_api_bloc/models/user.dart';
import 'dart:async';
class UserApiProvider{
  Client client = Client();
  final _url= 'https://reqres.in/api/users/?page=1';

  Future<List<User>> fetchuserlist() async{
    print("masuk");
    final response = await client.get(_url);

    if(response.statusCode==200){
      print(response.body);
      return compute(userFromJson, response.body);
    }else{
      throw Exception('failed load data');
    }
  }
  
  Future addData(title) async{
    print('klik api create');
    final response = await client.post('https://reqres.in/api/users',body:{
      "name": "morpheus",
      "job": title
    });

    if(response.statusCode == 200){
      return response;
    }else{
      throw Exception('failed Add data');
    }
  }

}