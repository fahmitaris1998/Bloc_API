import 'package:flutter/material.dart';
import 'package:flutter_api_bloc/bloc/userbloc.dart';
import 'package:flutter_api_bloc/resources/userApiProvider.dart';

import '../bloc/userbloc.dart';
import '../main.dart';
import 'home.dart';

class Create extends StatefulWidget {
  final String id_user;
  final String nama2;
  final String jenis_kelamin;
  final String id_parent;

  const Create({Key key, this.id_user, this.nama2, this.jenis_kelamin, this.id_parent}) : super(key: key);
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {


  var nama = TextEditingController();
  var jk = TextEditingController();
  var idparent = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    bloc.dispose();
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    if(widget.id_user!=null){
      nama.text=widget.nama2;
      jk.text=widget.jenis_kelamin;
      idparent.text=widget.id_parent;
    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: nama,
              onChanged: bloc.updatedata,
              maxLines: 1,
              decoration: InputDecoration(hintText: 'Input Name'),
            ),
            TextField(
              controller: jk,
              onChanged: bloc.updatedatajk,
              maxLines: 1,
              decoration: InputDecoration(hintText: 'Input Gender'),
            ),
            TextField(
              controller: idparent,
              onChanged: bloc.updatedataidparent,
              maxLines: 1,
              decoration: InputDecoration(hintText: 'Input ID Parent'),
            ),
            RaisedButton(
                onPressed:(){
                  setState(() {
                    if (widget.id_user==null){
                      bloc.addsavedata();
                      print("create ni");
                    }else{
                      bloc.updateSaveData(widget.id_user,nama.text,jk.text,idparent.text);
                      print("upadate ni");
                      // print(iduser.text+" "+nama.text+" "+jk.text+" "+idparent.text);
                      // final userapiprovider = UserApiProvider();
                      // userapiprovider.updateData(iduser.text, nama.text, jk.text, idparent.text);
                    }
                    nama.text="";
                    jk.text="";
                    idparent.text="";
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>MyApp()));

                  });
                  },
                child: Text("Submit"),
                )
          ],
        ),
      ),
    );
  }
}
