import 'package:flutter_api_bloc/resources/userApiProvider.dart';
import 'package:flutter_api_bloc/models/user.dart';
import 'dart:async';

class Repository{
  final userapiprovider = UserApiProvider();

  Future<List<User>> fetchalluser() => userapiprovider.fetchuserlist();
  Future addSaveData(String title,String jk,String idparent) => userapiprovider.addData(title,jk,idparent);
  Future updateSaveData(String iduser,String title,String jk,String idparent) => userapiprovider.updateData(iduser,title, jk, idparent);
  Future deleteData(String iduser)=>userapiprovider.deletedata(iduser);
}