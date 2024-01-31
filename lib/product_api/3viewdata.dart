import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import '2products.dart';
import 'package:http/http.dart' as http;

class particular_data extends StatefulWidget {
  const particular_data({super.key});

  @override
  State<particular_data> createState() => _particular_dataState();
}

class _particular_dataState extends State<particular_data> {

  double _rating = 3;

  @override
  Widget build(BuildContext context) {

    product p=ModalRoute.of(context)!.settings.arguments as product;
    Future getdata()
    async {
      var url = Uri.https('dummyjson.com','products/${p.id}');
      var response = await http.get(url);

      Map m=jsonDecode(response.body);
      // print(m);
      return m;
    }
    return Scaffold(
      appBar: AppBar(title: Text("${p.title}"),),
      body: FutureBuilder(future: getdata(),
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
                  Map m=snapshot.data;
                  List l=m['images'];
                  return Column(
                    children: [
                      Expanded(child: Container(
                       alignment: Alignment.center,
                        child: Text("${p.title}",style: TextStyle(fontSize:25),),
                      )),
                      Expanded(flex: 8,
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Image.network("${p.thumbnail}"),
                      )),
                      Expanded(child: Container(
                        alignment: Alignment.center,
                        child: Text("${p.description}"),
                      )),
                      Expanded(child: Container(
                            child: GFRating(
                              value: _rating,
                              onChanged: (value) {
                                setState(() {
                                  _rating = value;
                                });
                              },
                            ),
                      )),
                      Expanded(child: Container(
                        child: Text(" Price - ${p.price} ₹"),
                      )),
                      Expanded(child: Container(
                      child: Text(" Brand - ${p.brand} "),
                      )),
                    ],
                  );

                }
              else
                {
                  return Center(child: Text("No Data"));
                }
          }

      },),
    );
  }
}
