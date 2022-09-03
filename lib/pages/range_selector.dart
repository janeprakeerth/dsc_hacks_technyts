import 'package:dsc_hacks_technyts/pages/HomePage.dart';
import 'package:dsc_hacks_technyts/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class range_selector extends StatefulWidget {
  const range_selector({Key? key}) : super(key: key);

  @override
  State<range_selector> createState() => _range_selectorState();
}

class _range_selectorState extends State<range_selector> {
  double value = 5;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
            value: value,
            min: 0,
            max: 100,
            divisions: 20,
            activeColor: AppColors.mainColor,
            inactiveColor: Colors.red.shade100,
            label: value.round().toString(),
            onChanged: (value) => setState(() {
              this.value = value;
            }),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage(
                            range: value * 1000,
                          )));
            },
            child: Container(
              height: height * 0.075,
              width: width * 0.8,
              color: AppColors.mainColor,
              child: Center(
                child: Text(
                  "Update Range",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: height * 0.028),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
