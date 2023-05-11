import 'package:alarm/alarm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:selfieera_greeting/screens/greeting_calender.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await Alarm.init();

  try {
    var status = await Permission.notification.status;
    if (status.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.notification,
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
  try {
    var status = await Permission.location.serviceStatus;
    if (status.isEnabled) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
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
