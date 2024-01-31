import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '1insert_data.dart';

class show_data extends StatefulWidget {
  const show_data({super.key});

  @override
  State<show_data> createState() => _show_dataState();
}

class _show_dataState extends State<show_data> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // data();
  }
  Future datas()
  async {
    var url = Uri.parse('https://apidevlopement.000webhostapp.com/2Api_view_data.php');
    var response = await http.get(url);
    Map m=jsonDecode(response.body);
     List l=m['res'];
    print(m);
    return l;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View_data"),),
      body: FutureBuilder(future: datas(),
        builder: (context, snapshot) {
       if(snapshot.connectionState==ConnectionState.done)
         {
           List l=snapshot.data;
           return ListView.builder(itemCount: l.length,
             itemBuilder: (context, index) {
             return Card(
               child: ListTile(
                 title: Text("${l[index]['name']}"),
                 subtitle: Text("${l[index]['contact']}"),
                 trailing: Wrap(children: [
                   IconButton(onPressed: () {
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          title: Text("Are you sure for records deleted.."),
                          actions: [
                            TextButton(onPressed: () {
                              Navigator.pop(context);
                            }, child: Text("No")),
                            TextButton(onPressed: () async {
                              var url = Uri.parse('https://apidevlopement.000webhostapp.com/3Api_delete_data.php?id=${l[index]['id']}');
                              var response = await http.get(url);
                              print(response.body);
                              Navigator.pop(context);
                              setState(() {

                              });
                            }, child: Text("Yes"))
                          ],
                        );
                      },);

                   }, icon: Icon(Icons.delete)),
                   IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return data(l[index]);
                      },));
                   }, icon: Icon(Icons.edit)),
                 ]),
               ),
             );
           },);
         }
       else
         {
           return CircularProgressIndicator();
         }
      },),
    );
  }
}
