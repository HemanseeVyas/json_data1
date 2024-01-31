import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import '2myclassget.dart';
import '3storedata.dart';

void main()
{
      runApp(GetMaterialApp(debugShowCheckedModeBanner: false,home: storedata(),));
}
class storedata extends StatefulWidget {
  const storedata({super.key});

  @override
  State<storedata> createState() => _storedataState();
}

class _storedataState extends State<storedata> {
  TextEditingController total=TextEditingController();
  TextEditingController max=TextEditingController();
  TextEditingController min=TextEditingController();
  GetStorage box=GetStorage();

  @override
  Widget build(BuildContext context) {
    myclassget myclaas=Get.put(myclassget());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Task"),),
      body: Column(children: [
           TextField(controller: total,),
            TextField(controller: max,),
            TextField(controller: min,),
        SizedBox(height: 10,),
            ElevatedButton(onPressed: () {

              myclaas.alldataget(total.text,max.text,min.text);

            }, child: Text("Submit")),
        SizedBox(height: 10,),
        Obx(() => Text("Total = ${myclaas.total.value}")),
        SizedBox(height: 10,),
        Obx(() => Text("Max = ${myclaas.max.value}")),
        SizedBox(height: 10,),
        Obx(() => Text("Min = ${myclaas.min.value}")),
        SizedBox(height: 10,),
        ElevatedButton(onPressed: () {

          box.write('total', '${myclaas.total.value}');
          box.write('max', '${myclaas.max.value}');
          box.write('min', '${myclaas.min.value}');

          Get.defaultDialog(title: "Dialogue Box",
            content: Text("You are confirm this data is store"),
            actions: [
              TextButton(onPressed: () {
                Navigator.pop(context);
              }, child: Text("Ok")),
            ]
          );

        }, child: Text("Data Store")),
        SizedBox(height: 10,),
        ElevatedButton(onPressed: () {
          Get.to(datastore());
        }, child: Text("View"))
      ]),
    );
  }
}
