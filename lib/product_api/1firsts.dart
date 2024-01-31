import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '2products.dart';
import '3viewdata.dart';


void main()
{
    // print("hello");
    // runApp(MaterialApp(debugShowCheckedModeBanner: false,home: dataadd(),));
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
    routes: {
      "detail" :(context) => dataadd(),
      "first":(context) => particular_data(),
    },
    initialRoute: "detail",
  ));
}
class dataadd extends StatefulWidget {
  const dataadd({super.key});

  @override
  State<dataadd> createState() => _dataaddState();
}


class _dataaddState extends State<dataadd> {

  bool search =false;
  Map m={};
  String str="";

 Future getdata(String str)
  async {
   Uri url=Uri();
   if(str=="")
     {
          url = Uri.https('dummyjson.com','products');
     }
   else
     {
          url=Uri.parse("https://dummyjson.com/products/search?q=$str");
     }

    var response = await http.get(url);

    m=jsonDecode(response.body);
    // print(m);
    return m;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: search ?
     AppBar(
       title: TextField(onChanged: (value) {
          setState(() {
            str=value;
          });
       },),
       actions: [
         IconButton(onPressed: () {
           str="";
           getdata(str);
           setState(() {
             search=!search;
           });
         }, icon: Icon(Icons.cancel)),
       ],
     ):
     AppBar(
       title: Text("Products"),
       actions: [
         IconButton(onPressed: () {
           setState(() {
             search=!search;
           });
         }, icon: Icon(Icons.search)),
       ],
     ),
      body: FutureBuilder(
        future: getdata("$str"),
        builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting)
          {
                return Center(
                  child: CircularProgressIndicator(),
                );
          }
        else
          {
              if(snapshot.hasData)
                {
                  m=snapshot.data as Map;
                  List l=m['products'];
                  return ListView.builder(itemCount: l.length,
                    itemBuilder: (context, index) {

                      product s=product.fromJson(l[index]);
                      // print(s);
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, "first", arguments: s);
                            },
                            title: Text("${s.title}"),
                            subtitle: Text("${s.description}",maxLines: 1),
                            trailing: Text("${s.price}"),
                            leading: CircleAvatar(backgroundImage: NetworkImage("${s.thumbnail}"),)
                          ),
                        );
                  },);
                }
              else
                {
                  return Center(child: Text("No Data"),);
                }
          }
      },),
    );
  }
}
