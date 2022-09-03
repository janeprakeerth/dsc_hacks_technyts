import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_hacks_technyts/pages/GoogleMaps.dart';
import 'package:dsc_hacks_technyts/pages/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../texts/BoldText.dart';
import '../utils/colors.dart';
import 'Login.dart';

class AddAnAmbulance extends StatefulWidget {
  const AddAnAmbulance({Key? key}) : super(key: key);

  @override
  State<AddAnAmbulance> createState() => _AddAnAmbulanceState();
}

class _AddAnAmbulanceState extends State<AddAnAmbulance> {
  TextEditingController name_hospital_controller = TextEditingController();
  TextEditingController name_drive_controller = TextEditingController();
  TextEditingController driver_mobile_number_controller =
      TextEditingController();
  TextEditingController vehichle_number_controller = TextEditingController();
  TextEditingController hospital_address_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: deviceWidth,
              height: deviceHeight / 3,
              margin: EdgeInsets.only(
                  top: deviceWidth / 12,
                  left: deviceWidth / 24,
                  right: deviceWidth / 24,
                  bottom: deviceWidth / 24),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/image/ambulance_gif.gif"),
                fit: BoxFit.fitWidth,
              )),
            ),
            BoldText(
              text: "Please Enter Your Ambulance Details",
              size: 20,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: deviceWidth / 18, right: deviceWidth / 18),
              child: TextField(
                controller: name_hospital_controller,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.drive_file_rename_outline,
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
                  hintText: "Name of the Hospital",
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
            Container(
              margin: EdgeInsets.only(
                  left: deviceWidth / 18, right: deviceWidth / 18),
              child: TextField(
                controller: name_drive_controller,
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
                        color: AppColors.mainColor, style: BorderStyle.solid),
                  ),
                  hintText: "Name of the driver",
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
            Container(
              margin: EdgeInsets.only(
                  left: deviceWidth / 18, right: deviceWidth / 18),
              child: TextField(
                controller: driver_mobile_number_controller,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(deviceWidth * 0.04),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(deviceWidth * 0.04),
                      borderSide: BorderSide(
                          color: AppColors.mainColor, style: BorderStyle.solid),
                    ),
                    hintText: "Driver's Mobile Number",
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(deviceWidth * 0.02),
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: deviceWidth / 18, right: deviceWidth / 18),
              child: TextField(
                controller: vehichle_number_controller,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.car_rental,
                      color: Colors.black,
                    ),
                    hintText: "Vehicle Number",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(deviceWidth * 0.04),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(deviceWidth * 0.04),
                      borderSide: BorderSide(
                          color: AppColors.mainColor, style: BorderStyle.solid),
                    ),
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(deviceWidth * 0.02),
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: deviceWidth / 18, right: deviceWidth / 18),
              child: TextField(
                controller: hospital_address_controller,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: Colors.black,
                    ),
                    hintText: "Hospital Address",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(deviceWidth * 0.04),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(deviceWidth * 0.04),
                      borderSide: BorderSide(
                          color: AppColors.mainColor, style: BorderStyle.solid),
                    ),
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(deviceWidth * 0.02),
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async {
                try {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GoogleMaps(
                                name_of_hospital: name_hospital_controller.text,
                                name_of_driver: name_drive_controller.text,
                                driver_mobile_number:
                                    driver_mobile_number_controller.text,
                                vehicle_number: vehichle_number_controller.text,
                                hosptal_address:
                                    hospital_address_controller.text,
                              )));
                } catch (error) {
                  print(error.toString());
                }
                print("Ambulance added");
              },
              child: Container(
                width: deviceWidth,
                height: deviceHeight / 15.12,
                margin: EdgeInsets.only(
                    left: deviceWidth / 9, right: deviceWidth / 9),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(deviceHeight / 37.8),
                ),
                child: Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
