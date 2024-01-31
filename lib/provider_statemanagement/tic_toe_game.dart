import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '2myclasses.dart';

void main()
{
      runApp(MaterialApp(debugShowCheckedModeBanner: false,home: MultiProvider( providers:[
      ChangeNotifierProvider(create: (context) => myclass1(),)
      ],
        child: providr(),
      ),));
}
class providr extends StatelessWidget {
  const providr({super.key});

  @override
  Widget build(BuildContext context) {
    myclass1 m=Provider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Tic_Toe_Game"),),
      body: Column(children: [
        Expanded(child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.purple,
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            child: Text("${m.msg}",style: TextStyle(color: Colors.white,fontSize: 20),),
        )),
        Expanded(
          child: Row(children: [
            button(context,m,0),
            button(context,m,1),
            button(context,m,2),
          ],),
        ),
        Expanded(
          child: Row(children: [
            button(context,m,3),
            button(context,m,4),
            button(context,m,5),
          ],),
        ),
        Expanded(
          child: Row(children: [
            button(context,m,6),
            button(context,m,7),
            button(context,m,8),
          ],),
        ),
        ElevatedButton(onPressed: () {
          m.reset();
        }, child: Text("RESET")),

      ]),

    );
  }

  button(BuildContext context,myclass1 m,int i)
  {
    return Expanded(
      child: InkWell(onTap: () {
        m.get(i);
      },
        child: Container(
          height:double.infinity,
          width: double.infinity,
          margin: EdgeInsets.all(5),
          color: Colors.deepPurple,
          alignment: Alignment.center,
          child:Text("${m.l[i]}",style: TextStyle(fontSize: 20,color: Colors.white),),
        ),
      ),
    );
  }
}
