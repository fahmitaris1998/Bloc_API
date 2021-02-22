import 'package:flutter_api_bloc/resources/userApiProvider.dart';
import 'package:flutter_api_bloc/models/user.dart';
import 'dart:async';

class Repository{
  final userapiprovider = UserApiProvider();

  Future<List<User>> fetchalluser() => userapiprovider.fetchuserlist();
  Future addSaveData(String title) => userapiprovider.addData(title);
}