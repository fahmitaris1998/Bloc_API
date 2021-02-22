import 'package:flutter/material.dart';
import 'package:flutter_api_bloc/bloc/userbloc.dart';
import 'package:flutter_api_bloc/models/user.dart';

import 'carduser.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    bloc.fecthalluser();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    bloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: bloc.allUser,
        builder: (context, AsyncSnapshot<List<User>> snapshot){
          if(snapshot.data != null){
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,index){
                  return CardProfile(user: snapshot.data[index],);
                }
            );
          }else{
            return Text("asdasd");
          }
        },
      ),
    );
  }
}
