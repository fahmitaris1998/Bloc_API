import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;
import 'package:flutter_api_bloc/models/user.dart';
import 'dart:async';
class UserApiProvider{
  Client client = Client();
  final _url= 'http://192.168.13.107/read.php';

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
  
  Future addData(title,jk,idparent) async{
    print('klik api create');
    var response = await client.post('http://192.168.13.107/create.php',body:{
      "nama": title,
      "jeniskelamin": jk,
      "idparent":idparent
    });
    print("inisii");

    if(response.statusCode == 200){
      return response;
    }else{
      throw Exception('failed Add data');
    }


  }

  Future updateData(iduser,title,jk,idparent) async{
    print('klik api update');
    var response = await client.post('http://192.168.13.107/update.php',body:{
      "id_user":iduser,
      "nama": title,
      "jeniskelamin": jk,
      "idparent":idparent
    });
    print("inisii");

    if(response.statusCode == 200){
      return response;
    }else{
      throw Exception('failed update data');
    }
  }

  Future deletedata(iduser) async{
    print("klik API delete");
    var url= 'http://192.168.13.107/delete.php';
    var response = await client.post(url,body: {
      'iduser':iduser
    });

    if(response.statusCode == 200){
      return response;
    }else{
      throw Exception('failed update data');
    }

  }

}