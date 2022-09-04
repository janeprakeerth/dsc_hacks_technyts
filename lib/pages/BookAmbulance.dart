import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_hacks_technyts/pages/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class BookAmbulance extends StatefulWidget {
  final String HospitalName;
  final String HospitalAddress;
  final String DriverName;
  final String DriverMobileNumber;
  final String HospitalLatitude;
  final String HospitalLongitude;
  final String? UserLatitude;
  final String? UserLongitude;
  final String VehicleNumber;
  //final String uid = "";
  const BookAmbulance(
      {Key? key,
      required this.HospitalName,
      required this.HospitalAddress,
      required this.DriverName,
      required this.DriverMobileNumber,
      required this.HospitalLatitude,
      required this.HospitalLongitude,
      required this.UserLatitude,
      required this.UserLongitude,
      required this.VehicleNumber})
      : super(key: key);

  @override
  State<BookAmbulance> createState() => _BookAmbulanceState();
}

class _BookAmbulanceState extends State<BookAmbulance> {
  TextEditingController patient_name = TextEditingController();
  TextEditingController patient_age = TextEditingController();
  TextEditingController patient_address = TextEditingController();
  TextEditingController patient_emergency = TextEditingController();

  @override
  void initState() {
    print("okokokokokok");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.UserLatitude);
    print(widget.UserLongitude);
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text("Please fill the patient details"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: deviceWidth / 18, right: deviceWidth / 18),
                child: TextField(
                  controller: patient_name,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(deviceWidth * 0.04),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(deviceWidth * 0.04),
                      borderSide: BorderSide(
                        color: AppColors.mainColor,
                      ),
                    ),
                    hintText: "Patient Name",
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(deviceWidth * 0.02),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: deviceWidth / 18, right: deviceWidth / 18),
                child: TextField(
                  controller: patient_age,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.accessibility,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(deviceWidth * 0.04),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(deviceWidth * 0.04),
                      borderSide: BorderSide(
                        color: AppColors.mainColor,
                      ),
                    ),
                    hintText: "Patient Age",
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(deviceWidth * 0.02),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: deviceWidth / 18, right: deviceWidth / 18),
                child: TextField(
                  controller: patient_address,
                  maxLines: 5,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(deviceWidth * 0.04),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(deviceWidth * 0.04),
                      borderSide: BorderSide(
                        color: AppColors.mainColor,
                      ),
                    ),
                    hintText: "Patient Address",
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(deviceWidth * 0.02),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: deviceWidth / 18, right: deviceWidth / 18),
                child: TextField(
                  controller: patient_emergency,
                  maxLines: 6,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.error,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(deviceWidth * 0.04),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(deviceWidth * 0.04),
                      borderSide: BorderSide(
                        color: AppColors.mainColor,
                      ),
                    ),
                    hintText: "Patient Emergency",
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(deviceWidth * 0.02),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () async {
                    String? uid = FirebaseAuth.instance.currentUser?.uid;
                    CollectionReference booking =
                        await FirebaseFirestore.instance.collection('bookings');
                    try {
                      await booking.add({
                        'HospitalName': widget.HospitalName,
                        'HospitalAddress': widget.HospitalAddress,
                        'DriverName': widget.DriverName,
                        'DriverMobileNumber': widget.DriverMobileNumber,
                        'HospitalLatitude': widget.HospitalLatitude,
                        'HospitalLongitude': widget.HospitalLongitude,
                        'UserLatitude': widget.UserLatitude,
                        'UserLongitude': widget.UserLongitude,
                        'VehicleNumber': widget.VehicleNumber,
                        'PatientName': patient_name.text,
                        'PatientAddress': patient_address.text,
                        'PatientEmergency': patient_emergency.text,
                        'PatientAge': patient_age.text,
                        'userId': uid,
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } catch (error) {
                      print(error);
                    }
                  },
                  child: Container(
                    height: deviceHeight * 0.065,
                    width: deviceWidth * 0.75,
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text(
                        "Book",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: deviceHeight * 0.028),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
