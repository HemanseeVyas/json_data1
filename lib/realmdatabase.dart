import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_data1/realmdetails.dart';
import 'package:realm/realm.dart';


Future<void> main()
async {

  // final realmAppId = 'your_realm_app_id';
  // void _initializeRealmApp() async {
  //   await Realm.initializeApp(
  //     id: realmAppId,
  //     shouldEncrypt: true, // Set to true if you want to encrypt the database
  //   );

    // await Realm.init();
      runApp(MaterialApp(debugShowCheckedModeBanner: false,home: data(),));




}
class data extends StatefulWidget {
  const data({super.key});


  @override
  State<data> createState() => _dataState();
}

class _dataState extends State<data> {


  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();

  late Realm realm;

  // late int id;
  //
  // late String textFieldData;

  // void initRealm() async {
  //   // final realm = await Realm.open();
  //   // You can store the realm instance in a global variable for easy access.
  //   // Example: globalRealm = realm;
  // }

  //
  // Future<void> openRealm() async {
  //   realm = await Realm.open(openRealm() as Configuration);
  // }
  //
  // Future<void> insertData(String textFieldData) async {
  //   await realm.write(() {
  //     // final newData = data();
  //     // realm.create(newData);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // var config=Configuration.local([Detailmodel.schema]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Realm"),
      ),
      body: Column(children: [
        TextField(controller: t1,decoration: InputDecoration(hintText: "Enter name"),),
        TextField(controller: t2,decoration: InputDecoration(hintText: "Enter contact"),),
        SizedBox(height: 10,),
        ElevatedButton(onPressed: () async {

          // var realm=Realm(config);
          // realm.all<Detailmodel>();
            realm.all().changes.listen((event) {
              print("data");
            });

            Future.delayed(Duration(seconds: 1));
            // var detailmodel=Detailmodel('name','contact');
            realm.write(() {
              // detailmodel.name=t1.text;
              // detailmodel.contact=t2.text;
            });
            // realm.add(detailmodel);

          //1
          // final realm = await Realm.open();
          //
          //   realm.write(() {
          //     realm.create('Person', {'name': 'John Doe', 'age': 25});
          //   });

          //2
          // await databaseHelper.openRealm();
          // await databaseHelper.insertData(t1.text);
          // await databaseHelper.closeRealm();

        }, child: Text("Submit"))
      ]),
    );
  }
}

