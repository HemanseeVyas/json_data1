import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
      runApp(MaterialApp(debugShowCheckedModeBanner: false,home: musicdata(),));
}
class musicdata extends StatefulWidget {
  const musicdata({super.key});

  @override
  State<musicdata> createState() => _musicdataState();
}

class _musicdataState extends State<musicdata> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  getdata()
  {

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Music History..."),),
      // body: FutureBuilder(future: getdata(), builder: (context, snapshot) {
      //
      //     if(snapshot.connectionState==ConnectionState.waiting)
      //       {
      //               if(snapshot.hasData)
      //                 {
      //
      //                 }
      //
      //       }
      //     else
      //     {
      //       return CircularProgressIndicator();
      //     }
      //
      // },)
    );
  }
}
