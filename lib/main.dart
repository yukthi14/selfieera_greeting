import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:selfieera_greeting/screens/greeting_calender.dart';
import 'package:selfieera_greeting/screens/notification_service.dart';
import 'package:timezone/data/latest.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  tz.initializeTimeZones();
  try {
    await Firebase.initializeApp();
    var status = await Permission.notification.status;
    var notifyStatus = await Permission.accessNotificationPolicy.status;
    if (status.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.notification,
        Permission.accessNotificationPolicy,
        Permission.audio,
        Permission.scheduleExactAlarm,
        Permission.calendar,
      ].request();
      if (kDebugMode) {
        print(statuses);
      }
    }
    if (notifyStatus.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.accessNotificationPolicy,
      ].request();
      if (kDebugMode) {
        print(statuses);
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // getCountryName();  get location function........
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GreetingCalender(),
    );
  }
//  getCountryName() async{
//   SharedPreferences preferences= await SharedPreferences.getInstance();
//   if(preferences.getString('location') == null) {
//     try{
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     List<Placemark> placemarks =
//         await placemarkFromCoordinates(position.latitude, position.longitude);
//    preferences.setString('location',placemarks[0].country.toString().toLowerCase());
//   }catch(e){
//      print(e.toString());
//    }
//   }
// }
}
