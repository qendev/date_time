import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(home: MyTime()));
}

class MyTime extends StatefulWidget {
  @override
  _MyTimeState createState() => _MyTimeState();
}

class _MyTimeState extends State<MyTime> {
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime, builder: (BuildContext context, Widget child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child,
      );});

    if (picked_s != null && picked_s != selectedTime )
      setState(() {
        selectedTime = picked_s;
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Timer Picker'),
          centerTitle: true,
        ),
        body: Center(
          child: TextButton(
          onPressed: () async{
            print('TIME CLICKED');
            _selectTime(context);

          },
            child: Icon(
              Icons.timer,
              size: 32.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}



