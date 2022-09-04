import 'package:dsc_hacks_technyts/pages/BookAmbulance.dart';
import 'package:dsc_hacks_technyts/pages/GoogleMaps.dart';
import 'package:dsc_hacks_technyts/pages/HomePage.dart';
import 'package:dsc_hacks_technyts/pages/Login.dart';
import 'package:dsc_hacks_technyts/pages/MyAmbulanceBookings.dart';
import 'package:dsc_hacks_technyts/pages/SignUp.dart';
import 'package:dsc_hacks_technyts/pages/StartPage.dart';
import 'package:dsc_hacks_technyts/pages/webview_track.dart';
import 'package:dsc_hacks_technyts/utils/colors.dart';
import 'package:dsc_hacks_technyts/utils/dimensions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      color: AppColors.mainColor,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: StartPage(),
    );
  }
}
