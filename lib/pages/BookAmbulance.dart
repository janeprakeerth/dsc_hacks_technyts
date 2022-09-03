import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class BookAmbulance extends StatefulWidget {
  const BookAmbulance({Key? key}) : super(key: key);

  @override
  State<BookAmbulance> createState() => _BookAmbulanceState();
}

class _BookAmbulanceState extends State<BookAmbulance> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Row(
          children: [
            Icon(
              Icons.arrow_back,
              color: Colors.white,
            )
          ],
        ),
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
                  maxLines: 5,
                  keyboardType: TextInputType.number,
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
                  maxLines: 10,
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
                    hintText: "Patient Emgergency",
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
                height: deviceHeight * 0.075,
                width: deviceWidth * 0.8,
                color: AppColors.mainColor,
                child: Center(
                  child: Text(
                    "Book",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: deviceHeight * 0.028),
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
