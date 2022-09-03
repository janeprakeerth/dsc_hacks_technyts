import 'package:cloud_firestore/cloud_firestore.dart';
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


  Future<bool> getDistance(double lat , double long) async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    currentUserPosition =
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(currentUserPosition!.latitude);
    print(currentUserPosition!.longitude);

    double dist_in_metre = Geolocator.distanceBetween(
        currentUserPosition!.latitude, currentUserPosition!.longitude,  lat,
        long);
    print("okok$dist_in_metre");
    if (dist_in_metre > 5000) {
      return false;
    }
    else
      {
        print("returned trueeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
        return true;
      }

  }


  var selected_num = 0;
   List<QueryDocumentSnapshot> alldata = [];
  @override
  void initState()  {
 FirebaseFirestore.instance.collection('ambulances').snapshots().forEach((element) {
  element.docs.forEach((eler) {
    // if(getDistance(eler['latitude'], eler['longitude']) as bool){
    //   print("okkkkkkkkkkkkkkkplplplplplplplpl");
    //   alldata.add(eler);
    // }
    print("okokokokokokok12121212");
    print(getDistance(eler['latitude'], eler['longitude']) as bool);

  });
});

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text("Home Page"),
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('ambulances').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            return ListView(
              children: snapshot.data!.docs.map((document)  {
                var longitude = document["longitude"];
                var latitude = document["latitude"];
                print(alldata);
                  return Card();
              }).toList(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainColor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddAnAmbulance()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) {
          setState(() {
            selected_num = index;
          });
        },
        items: [
          Icon(Icons.home_outlined,
              color: selected_num == 0 ? Colors.black : Colors.white),
          Icon(Icons.location_on_outlined,
              color: selected_num == 1 ? Colors.black : Colors.white),
          Icon(Icons.car_repair,
              color: selected_num == 2 ? Colors.black : Colors.white),
          Icon(Icons.chat_outlined,
              color: selected_num == 3 ? Colors.black : Colors.white),
          Icon(Icons.account_circle_outlined,
              color: selected_num == 4 ? Colors.black : Colors.white),
        ],
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.white,
        color: AppColors.mainColor,
        height: 60,
      ),
    );
  }
}
