import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dsc_hacks_technyts/DatabseManger/databasemanager.dart';
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

  Future<dynamic> getDistance(double lat, double long) async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    currentUserPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(currentUserPosition!.latitude);
    print(currentUserPosition!.longitude);

    double dist_in_metre = Geolocator.distanceBetween(
        currentUserPosition!.latitude,
        currentUserPosition!.longitude,
        lat,
        long);
    print("okok$dist_in_metre");
    if (dist_in_metre > 5000) {
      return Future.value(false);
    } else {
      print("returned trueeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      return Future.value(true);
    }
  }

  List Ambulanceslist = [];
  List NearAmbulanceList = [];
  var selected_num = 0;
  getDatabseList() async {
    dynamic resultant = await databasemanger().getAmbulanceList();
    if (resultant != null) {
      setState(() {
        Ambulanceslist = resultant;
      });
    }
    getNearAmbulanceList();
  }

  getNearAmbulanceList() async {
    print("len${Ambulanceslist.length}");
    for (int i = 0; i < Ambulanceslist.length; i++) {
      var ambulance = Ambulanceslist[i];

      double latitude = double.parse(ambulance['latitude']);
      double longitude = double.parse(ambulance['longitude']);
      print("okoko$latitude");
      getDistance(latitude, longitude).then((value) => {
            if (value == true)
              {
                print("prithvinoob"),
                setState(() {
                  NearAmbulanceList.add(ambulance);
                })
              }
          });
    }
  }

  @override
  void initState() {
    super.initState();
    getDatabseList();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    print("ac${NearAmbulanceList.length}");
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
              children: snapshot.data!.docs.map((document) {
                var longitude = document["longitude"];
                var latitude = document["latitude"];
                return Container(
                  width: double.maxFinite,
                  height: deviceHeight / 7.56,
                  color: Colors.blue,
                  margin: EdgeInsets.only(
                      left: deviceWidth / 18,
                      right: deviceWidth / 18,
                      top: deviceHeight / 7.56),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text("Sunshne Hospitals"),
                      ),
                      Container(
                        child: Text("Driver Name"),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_city_outlined,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: deviceWidth / 36,
                          ),
                          Container(
                            child: Text("Address"),
                          )
                        ],
                      )
                    ],
                  ),
                );
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
