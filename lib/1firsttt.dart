// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:json_data/2sec.dart';
// import 'package:realm/realm.dart';
//
// import '3viewss.dart';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: test(),
//   ));
// }
//
// class test extends StatefulWidget {
//   const test({super.key});
//
//   @override
//   State<test> createState() => _testState();
// }
//
// class _testState extends State<test> {
//   TextEditingController t1 = TextEditingController();
//   TextEditingController t2 = TextEditingController();
//
//   // late Realm realm;
//
//   @override
//   Widget build(BuildContext context) {
//     // Realm realm;
//     var config = Configuration.local([datas.schema]);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Realm"),
//       ),
//       body: Column(
//         children: [
//           TextField(
//             controller: t1,
//           ),
//           TextField(
//             controller: t2,
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           ElevatedButton(
//               onPressed: () async {
//                 var realm = Realm(config);
//                 realm.all<datas>().changes.listen((event) {
//                   print("Add Data");
//                 });
//               await  Future<void>.delayed(Duration(seconds: 1));
//                 var data = datas('name', 'contact');
//                 realm.write(() {
//                   data.name = t1.text;
//                   data.contact = t2.text;
//
//                   realm.add(data);
//                 });
//               },
//               child: Text("Add")),
//           ElevatedButton(
//               onPressed: () {
//                 var realm = Realm(config);
//                 var add = realm.all<datas>();
//                 // RealmResults<datas>datalist=realm.all<datas>();
//                 // print("${cars[1].name}");
//                 //   print(" insert data = ${.length}");
//
//                 // if(add.isEmpty)
//                 //   {
//                 //     print("No data in datalist");
//                 //   }
//
//                 // else
//                 //   {
//                 for (int i = 0; i < add.length; i++) {
//                   print("${add[i].name}");
//                 }
//                 // }
//                 // var realm = Realm(config);
//                 // // var cars = realm.all<datas>();
//                 // RealmResults<datas>datalist=realm.all<datas>();
//                 // // print("${cars[1].name}");
//                 // //   print(" insert data = ${.length}");
//                 // for(int i=0; i<add.length;i++)
//                 //   {
//                 //     print("${add[i].name}");
//                 //   }
//
//                 Navigator.push(context, MaterialPageRoute(
//                   builder: (context) {
//                     return view();
//                   },
//                 ));
//               },
//               child: Text("view"))
//         ],
//       ),
//     );
//   }
// }
