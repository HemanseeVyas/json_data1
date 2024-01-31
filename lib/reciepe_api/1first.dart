import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '2class.dart';
import '3viewpage.dart';

void main()
{
    // runApp(MaterialApp(debugShowCheckedModeBanner: false,home: receipe(),));
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
    routes: {
      "details" :(context) => receipe(),
      "firsts":(context) => viepages(),
    },
    initialRoute: "details",
  ));
}
class receipe extends StatefulWidget {
  const receipe({super.key});

  @override
  State<receipe> createState() => _receipeState();
}

class _receipeState extends State<receipe> {

  Future getdatas()
  async {
    var url = Uri.https('api.sampleapis.com','recipes/recipes');
    var response = await http.get(url);

    List  l=jsonDecode(response.body);
    // print(m);
    return l;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api"),),
      body: FutureBuilder(future: getdatas(),
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
                  dynamic m=snapshot.data;
                   print(m);
                   return ListView.builder(
                     itemCount: m.length,
                     itemBuilder: (context, index) {
                       recipe r=recipe.fromJson(m[index]);
                       print(m);
                       return Card(
                         child: ListTile(
                           title: InkWell(onTap: () {
                             Navigator.pushNamed(context, "firsts", arguments: r);
                           },
                             child: Container(
                               alignment: Alignment.center,
                               height: 200,
                               width: 200,
                               decoration: BoxDecoration(image: DecorationImage(opacity: 20,fit: BoxFit.fill,image: NetworkImage("${r.photoUrl}"))),
                               child: Text("${r.title}",style: TextStyle(color: Colors.white,fontSize: 20),),
                             ),
                           ),
                         ),
                       );
                     },);
                 }
               else
               {
                 return Center(child: Text("No Data"),);
               }
            }
      },)
    );
  }
}
