import 'package:animated_radio_buttons/animated_radio_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: slotes(),));
}
class slotes extends StatefulWidget {
  const slotes({super.key});

  @override
  State<slotes> createState() => _slotesState();
}

class _slotesState extends State<slotes> {

  TextEditingController time1=TextEditingController();
  TextEditingController time2=TextEditingController();
  String gender="";
  int? myVar = 0;
  int a=0,b=0,c=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Slot_Management"),),
      body: Column(children: [
        SizedBox(height: 20,),
        TextField(controller: time1,),
        SizedBox(height: 20,),
        TextField(controller: time2,),
        SizedBox(height: 20,),
       Row(children: [
         Expanded(
           child: AnimatedRadioButtons(
             backgroundColor: Colors.white,
             value: myVar ?? 0,
             layoutAxis: Axis.horizontal,
             buttonRadius: 40.0,
             items: [
               AnimatedRadioButtonItem(
                   label: "10",
                   color: Colors.black,
                   fillInColor: Colors.white,
                 labelTextStyle: TextStyle(color: Colors.teal),
                 
               ),
               AnimatedRadioButtonItem(
                   label: "20",
                   labelTextStyle: TextStyle(color: Colors.teal),
                   color: Colors.black,
                   fillInColor: Colors.white),
               AnimatedRadioButtonItem(
                   label: "30",
                   color: Colors.black,
                   labelTextStyle: TextStyle(color: Colors.teal),
                   fillInColor: Colors.white)
             ],
             onChanged: (value) {
               // myVar!=value;
               // value = myVar;
               myVar = value;
               setState(() {

               });
             },
           ),
         ),
       ],),
        SizedBox(height: 30,),

        // ListView.builder(itemBuilder: (context, index) {
        //   return Card(
        //     child: ListTile(
        //       title: Text("Hello"),
        //     ),
        //   );
        // },),
      ]),
    );
  }
}
//
// /*
//  * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
//  * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
//  */
// package wrapper;
//
// import java.util.Scanner;
//
//
// public class Extra {
//   public static void main(String[] args) {
//
// //        int a=2,b=4,c=10;
//   int a,b,c;
//   Scanner x = new Scanner(System.in);
//   System.out.print("Enter time1 = ");
//   a = x.nextInt();
//   System.out.print("Enter time1 = ");
//   b = x.nextInt();
//   System.out.print("Enter interval = ");
//   c = x.nextInt();
//
//   if(c==10)
//   {
//   while(a<b)
//   {
//
//   System.out.println(" "+a+" : "+c);
//   c=c+10;
//   if(c==60)
//   {
//   c=0;
//   a++;
//   //System.out.println(" "+a+" : "+c);
//   }
//   }
//   }
//   else if(c==20)
//   {
//   while(a<b)
//   {
//
//   System.out.println(" "+a+" : "+c);
//   c=c+20;
//   if(c==60)
//   {
//   c=0;
//   a++;
//   //System.out.println(" "+a+" : "+c);
//   }
//   }
//   }
//   else if(c==30)
//   {
//   while(a<b)
//   {
//
//   System.out.println(" "+a+" : "+c);
//   c=c+30;
//   if(c==60)
//   {
//   c=0;
//   a++;
//   //System.out.println(" "+a+" : "+c);
//   }
//
//   }
//   }
//   }
// }