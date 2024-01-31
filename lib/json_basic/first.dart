import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: map(),));
}
class map extends StatefulWidget {
  const map({super.key});

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {

  List<Map> l=[
    {
      'name' : 'demo',
      'contact' : 12345,
      'marks' :
      {
        'sub1' : {'theory' : 80, 'practical' : 77},
        'sub2' : {'theory' : 90, 'practical' : 87},
        'sub3' : {'theory' : 70, 'practical' : 97},
      }
    },

    {
      'name' : 'test',
      'contact' : 12345,
      'marks' :
      {
        'sub1' : {'theory' : 80, 'practical' : 77},
        'sub2' : {'theory' : 90, 'practical' : 87},
        'sub3' : {'theory' : 70, 'practical' : 97},
      }
    },

    {
      'name' : 'vyas',
      'contact' : 12345,
      'marks' :
      {
        'sub1' : {'theory' : 80, 'practical' : 77},
        'sub2' : {'theory' : 90, 'practical' : 87},
        'sub3' : {'theory' : 70, 'practical' : 97},
      }
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Json_Map"),),

      body: ListView.builder(itemCount: l.length,
        itemBuilder: (context, index) {
          Map m=l[index]['marks'];


          return ExpansionTile(
            title: Text("${l[index]['name']}"),
            subtitle: Text("${l[index]['contact']}"),
            children: m.entries.map((e) => Text(
              "${e.key} : (Theory) : ${e.value['theory']}  Practical : ${e.value['practical']}"
            )).toList(),
          );
      },),
    );
  }
}
