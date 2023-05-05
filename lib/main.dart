import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:selfieera_greeting/screens/greeting_calender.dart';
import 'package:selfieera_greeting/screens/notification_service.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:permission_handler/permission_handler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  tz.initializeTimeZones();
  try{
    var status = await Permission.notification.status;
    if (status.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.notification,
      ].request();
      print(statuses);
    }
  }catch(e){
    print(e.toString());
  }
  runApp(const MyApp());

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


