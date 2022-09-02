import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dsc_hacks_technyts/pages/AddAnAmbulance.dart';
import 'package:dsc_hacks_technyts/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position? currentUserPosition;
  double distanceInMeter = 0.0;

  Future getDistance() async{
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    currentUserPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(currentUserPosition!.latitude );
    print(currentUserPosition!.longitude );
    //print("okkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
  }

  @override
  void initState  () {

    getDistance();
  }
  @override
  Widget build(BuildContext context) {
    var selected_num = 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainColor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddAnAmbulance()));
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) {
          setState(() {
            selected_num = index;
          });
        },
        items: [
          Icon(Icons.home_outlined, color: Colors.black),
          Icon(Icons.location_on_outlined, color: Colors.black),
          Icon(Icons.car_repair, color: Colors.black),
          Icon(Icons.chat_outlined, color: Colors.black),
          Icon(Icons.account_circle_outlined, color: Colors.black),
        ],
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.white,
        color: AppColors.mainColor,
        height: 60,
      ),
    );
  }
}
