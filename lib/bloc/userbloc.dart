
import 'package:flutter/foundation.dart';
import 'package:flutter_api_bloc/models/user.dart';
import 'package:flutter_api_bloc/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
class UserBloc{
  final _repository = Repository();
  final _userfetcher = PublishSubject<List<User>>();
  final _title = BehaviorSubject<String>();

  Stream<List<User>> get allUser => _userfetcher.stream;
  Function(String) get updatedata => _title.sink.add;
  
  fecthalluser() async{
    List<User> user = await _repository.fetchalluser();
    _userfetcher.sink.add(user);
  }
  addsavedata(){
    print(_title.value);
    _repository.addSaveData(_title.value);
  }

  dispose(){
    _userfetcher.close();
    _title.close();
  }
}

final bloc = UserBloc();
