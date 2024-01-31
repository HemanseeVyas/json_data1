import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  String selectedInterval = '10'; // Default interval is 10 minutes
  List<String> timeSlots = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Slot app'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: t1,
              decoration: InputDecoration(labelText: 'Enter Time'),
            ),
            TextField(
              controller: t2,
              decoration: InputDecoration(labelText: 'Enter Time'),
            ),
            SizedBox(height: 20),
            Text('Select sec:'),
            Row(
              children: [
                Radio(
                  value: '10',
                  groupValue: selectedInterval,
                  onChanged: (value) {
                    setState(() {
                      selectedInterval = value.toString();
                    });
                  },
                ),
                Text('10 sec'),
                Radio(
                  value: '20',
                  groupValue: selectedInterval,
                  onChanged: (value) {
                    setState(() {
                      selectedInterval = value.toString();
                    });
                  },
                ),
                Text('20 sec'),
                Radio(
                  value: '30',
                  groupValue: selectedInterval,
                  onChanged: (value) {
                    setState(() {
                      selectedInterval = value.toString();
                    });
                  },
                ),
                Text('30 sec'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                generateTimeSlots();
                setState(() {

                });
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 20),
            Text('All Time Slots:'),
            Expanded(
              child: ListView.builder(
                itemCount: timeSlots.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(timeSlots[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  void generateTimeSlots() {
    timeSlots.clear();

    String startTimeText = t1.text;
    String endTimeText = t2.text;

    if (startTimeText.isNotEmpty && endTimeText.isNotEmpty) {
      try {
        TimeOfDay startTime = TimeOfDay(
          hour: int.parse(startTimeText.split(":")[0]),
          minute: int.parse(startTimeText.split(":")[1]),
        );

        TimeOfDay endTime = TimeOfDay(
          hour: int.parse(endTimeText.split(":")[0]),
          minute: int.parse(endTimeText.split(":")[1]),
        );

        int interval = int.parse(selectedInterval);

        while (startTime.hour < endTime.hour || (startTime.hour == endTime.hour && startTime.minute <= endTime.minute)) {
          timeSlots.add('${startTime.hour}:${startTime.minute.toString().padLeft(2, '0')}');
          startTime = startTime.replacing(
            hour: (startTime.hour * 60 + startTime.minute + interval) ~/ 60,
            minute: (startTime.minute + interval) % 60,
          );
        }

        setState(() {});
      } catch (e) {

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Please enter valid start and end times in the format HH:mm.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } else {

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter both start and end times.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

}