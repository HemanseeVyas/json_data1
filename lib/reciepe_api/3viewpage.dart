import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '2class.dart';


class viepages extends StatefulWidget {
  const viepages( {super.key});

  @override
  State<viepages> createState() => _viepagesState();
}

class _viepagesState extends State<viepages> {
  @override
  Widget build(BuildContext context) {

    recipe r=ModalRoute.of(context)!.settings.arguments as recipe;

    Future getdatas()
    async {
      var url = Uri.https('api.sampleapis.com','recipes/recipes/${r.id}');
      var response = await http.get(url);
      List  l=jsonDecode(response.body);
      // print(m);
      return l;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("${r.title}"),
      ),
      body: ListView(children: [
        Expanded(flex: 2,child: Container(
          margin: EdgeInsets.all(20),
          height: 200,
          width: 200,
          child: Image(fit: BoxFit.fill,image: NetworkImage("${r.photoUrl}")),
        )),
        Expanded(child: Container(
          // margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Text("${r.title}",style: TextStyle(fontSize: 30),),
        )),
        SizedBox(height: 10,),
        Expanded(child: Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
            CircleAvatar(
              backgroundColor: Colors.red,
              child:  IconButton(onPressed:  () {
              }, icon: Icon(Icons.fireplace,color: Colors.white,)),
            ),
            CircleAvatar(
              backgroundColor: Colors.orange,
              child:  IconButton(onPressed:  () {
              }, icon: Icon(Icons.room_service,color: Colors.white,)),
            ),
            CircleAvatar(
              backgroundColor: Colors.green,
              child:  IconButton(onPressed:  () {
              }, icon: Icon(Icons.share,color: Colors.white,)),
            ),
            CircleAvatar(
              backgroundColor: Colors.blue,
              child:  IconButton(onPressed:  () {
              }, icon: Icon(Icons.watch,color: Colors.white,)),
            )
          ]),
        )),
        SizedBox(height: 10,),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            height: 60,
            alignment: Alignment.center,
            color: Colors.green,
            child: Text("Ingredients Required"),
          ),
        ),
        SizedBox(height: 5,),
        Container(
          alignment: Alignment.center,
          child: Text("Time : - ${r.cookTime}"),
        ),
        SizedBox(height: 5,),
        Container(
          alignment: Alignment.center,
          child: Text("carbohydrate : - ${r.carbohydrate}"),
        ),
        SizedBox(height: 5,),
        Container(
          alignment: Alignment.center,
          child: Text("cholestero : - ${r.cholesterol}"),
        ),
        SizedBox(height: 5,),
        Container(
          alignment: Alignment.center,
          child: Text("cuisine : - ${r.cuisine}"),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          alignment: Alignment.center,
          child: Text("cuisine : - ${r.ingredients}"),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          alignment: Alignment.center,
          child: Text("cuisine : - ${r.ingredients}"),
        ),
        Expanded(child: Container(
          child: Text("${r.description}"),
        )),

      ],)
    );
  }
}
