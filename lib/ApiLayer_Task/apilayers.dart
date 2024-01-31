import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main()
{
    runApp(MaterialApp(debugShowCheckedModeBanner: false,home: api(),));
}
class api extends StatefulWidget {
  const api({super.key});

  @override
  State<api> createState() => _apiState();
}

class _apiState extends State<api> {

  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  TextEditingController t3=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API Layer"),),
      body: Column(children: [
            SizedBox(height: 40,),
        TextField(controller: t1, decoration: InputDecoration(hintText: "Amount_Add",labelText: "Amount_Add"),),
        SizedBox(height: 20,),
        TextField(controller: t2,decoration: InputDecoration(hintText: "From",labelText: "From"),
          onTap: () {
         return showCountryPicker(
            context: context,
            showPhoneCode: true, // optional. Shows phone code before the country name.
            onSelect: (Country country) {
              print('Select country: ${country.displayName}');
              t2.text=country.name;
            },
          );
        },),
        SizedBox(height: 20,),
        TextField(controller: t3,decoration: InputDecoration(hintText: "to",labelText: "to"),
          onTap: () {
          return showCountryPicker(
            context: context,
            showPhoneCode: true, // optional. Shows phone code before the country name.
            onSelect: (Country country) {
              print('Select country: ${country.displayName}');
              t3.text=country.name;
            },
          );
        },),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: () async {
          var url = Uri.parse('https://apidevlopement.000webhostapp.com/1apilayers.php?submit=submit&amount=${t1.text}&from=${t2.text}&to=${t3.text}');
          var response = await http.get(url);
          print('Response status: ${response.statusCode}');
          print('Response body: ${response.body}');

        }, child: Text("Submit")),
      ]),
    );
  }
}
