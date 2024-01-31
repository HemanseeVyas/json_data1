import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';


class datastore extends StatefulWidget {
  const datastore({super.key});

  @override
  State<datastore> createState() => _datastoreState();
}

class _datastoreState extends State<datastore> {
  GetStorage box=GetStorage();
  @override
  Widget build(BuildContext context) {
    // myclassget myclaas=Get.put(myclassget());

    return Scaffold(
      appBar: AppBar(
        title: Text("Data Store"),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          // Center(
          //   child: LoadingAnimationWidget.twistingDots(
          //     leftDotColor: const Color(0xFF1A1A3F),
          //     rightDotColor: const Color(0xFFEA3799),
          //     size: 200,
          //   ),
          // ),
        Text("                         Total - ${box.read('total')}",style: TextStyle(fontSize: 20),),
        Text("                         Max - ${box.read('max')}",style: TextStyle(fontSize: 20),),
        Text("                         Min - ${box.read('min')}",style: TextStyle(fontSize: 20),),
        ],
      ),
    );
  }
}
