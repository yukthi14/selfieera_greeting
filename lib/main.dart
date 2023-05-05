import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:selfieera_greeting/screens/greeting_calender.dart';

void main() {
  runApp(const MyApp());
Alarm.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  GreetingCalender(),
    );
  }
}


