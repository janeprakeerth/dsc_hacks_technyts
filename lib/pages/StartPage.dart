import 'package:dots_indicator/dots_indicator.dart';
import 'package:dsc_hacks_technyts/pages/SignUp.dart';
import 'package:dsc_hacks_technyts/texts/BoldText.dart';
import 'package:dsc_hacks_technyts/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'Login.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  PageController pageController = PageController();
  var _currPageValue = 0.0;
  String text = "Book An Ambulance";
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: deviceHeight / 2.2,
            margin: EdgeInsets.only(top: deviceHeight / 7),
            child: PageView.builder(
                controller: pageController,
                itemCount: 3,
                itemBuilder: (context, position) {
                  return Container(
                    child: Column(
                      children: [
                        Container(
                          height: deviceHeight / 2.52,
                          margin: EdgeInsets.only(
                              left: deviceWidth / 18, right: deviceWidth / 18),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/image/homepage_ambulance.jpeg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        BoldText(text: text),
                      ],
                    ),
                  );
                }),
          ),
          DotsIndicator(
            dotsCount: 3,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          SizedBox(
            height: deviceHeight / 12.6,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
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
                  "SIGN IN",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          SizedBox(
            height: deviceHeight / 75.6,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignUp()));
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
                  "SIGN UP",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
