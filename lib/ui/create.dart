import 'package:flutter/material.dart';
import 'package:flutter_api_bloc/bloc/userbloc.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            onChanged: bloc.updatedata,
            maxLines: 3,
            decoration: InputDecoration(hintText: 'Input Your Text!'),
          ),
          RaisedButton(
              onPressed:(){
                bloc.addsavedata();
              },
              child: Text("Submit"),
              )
        ],
      ),
    );
  }
}
