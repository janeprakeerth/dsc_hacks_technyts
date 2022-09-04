import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dsc_hacks_technyts/DatabseManger/databasemanager.dart';
import 'package:dsc_hacks_technyts/pages/AddAnAmbulance.dart';
import 'package:dsc_hacks_technyts/pages/BookAmbulance.dart';
import 'package:dsc_hacks_technyts/pages/Login.dart';
import 'package:dsc_hacks_technyts/pages/MyAmbulanceBookings.dart';
import 'package:dsc_hacks_technyts/pages/range_selector.dart';
import 'package:dsc_hacks_technyts/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  final double range;
  const HomePage({Key? key, this.range = 5000}) : super(key: key);
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
    if (dist_in_metre > widget.range) {
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
      await getDistance(latitude, longitude).then((value) => {
            if (value == true)
              {
                print("prithvinoob"),
                setState(() {
                  NearAmbulanceList.add(ambulance);
                  print("123${NearAmbulanceList.length}");
                })
              }
            else
              {print("bdbdbd")}
          });
    }
  }

  List<Container> getNearesAmbulances(double deviceHeight, double deviceWidth) {
    List<Container> cont = [];
    for (int i = 0; i < NearAmbulanceList.length; i++) {
      var ambulance = NearAmbulanceList[i];
      var x = Container(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0),
              child: Container(
                height: deviceHeight * 0.1,
                width: deviceWidth * 0.8,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25.0),
                      topLeft: Radius.circular(25.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: deviceHeight * 0.05,
                      width: deviceWidth * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "       ${ambulance['hospital_name']}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceHeight * 0.02),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.wysiwyg_outlined,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: deviceWidth * 0.08,
                        ),
                        Container(
                          height: deviceHeight * 0.05,
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "${ambulance['hospital_address']}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Container(
                  height: deviceHeight * 0.2,
                  width: deviceHeight * 0.8,
                  decoration: BoxDecoration(
                    color: Color(0xFFf5f4ed),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: deviceHeight * 0.01,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: deviceWidth * 0.07,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.network(
                              'https://googleflutter.com/sample_image.jpg',
                              height: 60.0,
                              width: 60.0,
                            ),
                          ),
                          SizedBox(
                            width: deviceWidth * 0.03,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                child: Text("${ambulance['driver_name']}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: deviceHeight * 0.025,
                                        fontWeight: FontWeight.bold)),
                                alignment: Alignment.centerLeft,
                              ),
                              Align(
                                child: Text(
                                    "${ambulance['driver_mobile_number']}",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: deviceHeight * 0.020,
                                        fontWeight: FontWeight.bold)),
                                alignment: Alignment.centerLeft,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: deviceWidth * 0.18,
                          ),
                          Icon(
                            Icons.info_outline_rounded,
                            color: Colors.black,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookAmbulance(
                                          HospitalName:
                                              ambulance['hospital_name'],
                                          HospitalAddress:
                                              ambulance['hospital_address'],
                                          DriverName: ambulance['driver_name'],
                                          DriverMobileNumber:
                                              ambulance['driver_mobile_number'],
                                          HospitalLatitude:
                                              ambulance['latitude'],
                                          HospitalLongitude:
                                              ambulance['longitude'],
                                          UserLatitude: currentUserPosition
                                              ?.latitude
                                              .toString(),
                                          UserLongitude: currentUserPosition
                                              ?.longitude
                                              .toString() as String,
                                          VehicleNumber:
                                              ambulance['vehicle_number'],
                                        )));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.circular(10.0)),
                            height: deviceHeight * 0.04,
                            width: deviceWidth * 0.4,
                            child: Center(
                                child: Text(
                              "Book Ambulance",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: deviceHeight * 0.018),
                            )),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      );
      cont.add(x);
    }
    return cont;
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text("Home Page"),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => range_selector()));
              },
              child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/image/slider.png"),
                    fit: BoxFit.cover,
                  ))),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: getNearesAmbulances(deviceHeight, deviceWidth),
        ),
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
          if (index == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyAmbulanceBookings()));
          }
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
