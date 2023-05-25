import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:selfieera_greeting/notification_handler.dart';
import 'package:selfieera_greeting/screens/greeting_calender.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationHandler().initialize();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print(e.toString());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GreetingCalender(),
    );
  }
}
