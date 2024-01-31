import 'package:flutter/material.dart';
import 'package:json_data1/2sec.dart';
import 'package:realm/realm.dart';

class view extends StatefulWidget {
  const view({super.key});

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {
  late Realm realm;

  @override
  Widget build(BuildContext context) {
    var config=Configuration.local([datas.schema]);
    var realm = Realm(config);
    var add = realm.all<datas>();
    // RealmResults<datas>datalist=realm.all<datas>();
    // print("${cars[1].name}");
    //   print(" insert data = ${.length}");
    for(int i=0; i<add.length;i++)
    {
      print("${add[i].name}");
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("View data"),
      ),
      body: ListView.builder(
      itemCount: add.length,
        itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text("${add[index].name}"),
            trailing: Wrap(
              children: [
                IconButton(onPressed: () {

                }, icon: Icon(Icons.delete))
              ],
            ),

          ),
        );
      },),
    );
  }
}
