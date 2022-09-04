import 'package:dsc_hacks_technyts/pages/webview_track.dart';
import 'package:dsc_hacks_technyts/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../DatabseManger/databasemanager.dart';

class MyAmbulanceBookings extends StatefulWidget {
  const MyAmbulanceBookings({Key? key}) : super(key: key);

  @override
  State<MyAmbulanceBookings> createState() => _MyAmbulanceBookingsState();
}

class _MyAmbulanceBookingsState extends State<MyAmbulanceBookings> {
  List bookingList = [];

  getDatabseBookingList() async {
    dynamic resultant = await databasemanger().getMybookingsList();
    if (resultant != null) {
      setState(() {
        bookingList = resultant;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getDatabseBookingList();
  }

  List<Container> getBookings() {
    List<Container> cont = [];
    for (int i = 0; i < bookingList.length; i++) {
      var bookings = bookingList[i];
      var x = Container(
        height: 230,
        child: Stack(
          children: [
            Positioned(
              child: Material(
                child: Container(
                    height: 180,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        new BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: new Offset(-10.0, 10.0),
                            blurRadius: 20.0,
                            spreadRadius: 4.0)
                      ],
                    )),
              ),
            ),
            Positioned(
                top: 0,
                left: 30,
                child: Card(
                  elevation: 10.0,
                  shadowColor: Colors.grey.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("map.jpg"),
                      ),
                    ),
                  ),
                )),
            Positioned(
                top: 60,
                left: 200,
                child: Container(
                  height: 150,
                  width: 160,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bookings['DriverName'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: AppColors.mainColor),
                        ),
                        Text(
                          bookings['DriverMobileNumber'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey),
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        Text(
                          bookings['HospitalName'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.mainColor),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WebViewTrack()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.circular(10.0)),
                            height: 20,
                            width: 80,
                            child: Center(
                                child: Text(
                              "Track",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      );
      cont.add(x);
    }
    return cont;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    //print(FirebaseAuth.instance.currentUser?.email.toString());
    print(bookingList.toString());

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
              color: AppColors.mainColor,
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 80,
                    left: 0,
                    child: Container(
                      height: 100,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          )),
                    )),
                Positioned(
                    top: 110,
                    left: 20,
                    child: Text(
                      "Your Bookings",
                      style:
                          TextStyle(fontSize: 25, color: AppColors.mainColor),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Column(
            children: getBookings(),
          )
        ],
      ),
    );
  }
}
