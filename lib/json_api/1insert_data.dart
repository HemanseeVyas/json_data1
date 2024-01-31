import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:json_data1/json_api/2view_data.dart';
void main()
{

  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: data(),));
}

//1> sublime->Api_data_data.php in file insert data
// 2 >http in search
//3>search->postman in google in open
class data extends StatefulWidget {
 // List ? l;
 // data([this.l]);

  final l;
   data([this.l]);

  @override
  State<data> createState() => _dataState();
}

class _dataState extends State<data> {

  final ImagePicker picker = ImagePicker();
  XFile? image;

  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  TextEditingController t3=TextEditingController();

  bool t=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.l!=null)
      {
          t1.text=widget.l['name'];
          t2.text=widget.l['contact'];
          t3.text=widget.l['city'];
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: (widget.l!=null)?Text("Update Contact"):Text("Add Contact"),),
      body: Column(
        children: [
          TextField(controller: t1,),
          TextField(controller: t2,),
          TextField(controller: t3,),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: () async {
            String name=t1.text;
            String contact=t2.text;
            String city=t3.text;

            // 4> postman->read->copy & paste in given below
            //5>000webhot open and show data
            //6>Api_add_data file view in website webhist in copy in url
            //7> http->readme -> import file in coli-line no-3
            //8 url copy in postman GET ma mukvi ane key add krine send krvi

            //9 GET url copy krine uri.parse ma mukvi
            // var url = Uri.https('example.com', 'whatsit/create');

            var url;
            if(widget.l!=null)
              {
                print("update");
                url = Uri.parse('https://apidevlopement.000webhostapp.com/Api_data_add.php?name=$name&contact=$contact&city=$city&up=${widget.l['id']}');
              }
            else
              {
                url = Uri.parse('https://apidevlopement.000webhostapp.com/Api_data_add.php?name=$name&contact=$contact&city=$city');
              }

            // var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
            var response = await http.get(url);
            print('Response status: ${response.statusCode}');
            // print('Response body: ${response.body}');

            Map m=jsonDecode(response.body);
            print(m);
          }, child: Text("Save")),
          TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return show_data();
              },));
          }, child: Text("View")),
          Row(children: [
            SizedBox(width: 10,),
            // (photo!=null)?
            Container(
              height: 100,
              width: 100,
              color: Colors.blue,
            )
                // :
                // Text("Load Images")
              ,
            SizedBox(width: 10,),
            ElevatedButton(onPressed: () {
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    title: Text("Add Your Images"),
                    actions: [
                      TextButton(onPressed: () async {
                        image = await picker.pickImage(source: ImageSource.camera);
                        t=true;
                        Navigator.pop(context);
                        setState(() {

                        });
                      }, child: Text("Cemera")),
                      TextButton(onPressed: () async {
                        image = await picker.pickImage(source: ImageSource.gallery);
                        t=true;
                        Navigator.pop(context);
                        setState(() {

                        });
                      }, child: Text("Gallary")),
                    ],
                  );
                },);
            }, child: Text("Choose Images"))
          ],),
        ],
      ),
    );
  }
}
