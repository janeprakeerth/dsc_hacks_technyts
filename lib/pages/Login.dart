import 'package:dsc_hacks_technyts/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: height * 0.03),
                Row(
                  children: [
                    Container(
                      height: height * 0.06,
                      width: width * 0.7,
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 40.0),
                          child: Text(
                            "WELCOME BACK...",
                            style: TextStyle(
                                color: Colors.white, fontSize: height * 0.025),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              bottomRight: Radius.circular(40.0)),
                          color: AppColors.mainColor),
                    ),
                    SizedBox(height: height * 0.06, width: width * 0.05),
                    Container(
                        padding: EdgeInsets.all(width * 0.015),
                        height: height * 0.06,
                        width: width * 0.2,
                        child: Image.network(
                            'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'))
                  ],
                ),
                Container(
                  height: height * 0.08,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        "Enter your email id to continue...",
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: height * 0.02,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.065),
                Container(
                  margin: EdgeInsets.only(left: width / 18, right: width / 18),
                  child: TextField(
                    controller: emailcontroller,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width * 0.04),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width * 0.04),
                          borderSide: BorderSide(
                              color: AppColors.mainColor,
                              style: BorderStyle.solid),
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w200),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width * 0.02),
                        )),
                  ),
                ),
                SizedBox(height: height * 0.02),
                Container(
                  margin: EdgeInsets.only(left: width / 18, right: width / 18),
                  child: TextField(
                    controller: passwordcontroller,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        suffixIcon: Icon(
                          Icons.visibility,
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width * 0.04),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width * 0.04),
                          borderSide: BorderSide(
                              color: AppColors.mainColor,
                              style: BorderStyle.solid),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w200),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width * 0.02),
                        )),
                  ),
                ),
                SizedBox(height: height * 0.02),
                InkWell(
                  onTap: () async {
                    await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: emailcontroller.text,
                            password: passwordcontroller.text)
                        .then((value) => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()))
                            });
                  },
                  child: Container(
                    height: height * 0.075,
                    width: width * 0.8,
                    color: AppColors.mainColor,
                    child: Center(
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: height * 0.028),
                      ),
                    ),
                  ),
                ),
                Container(
                    height: height * 0.04,
                    child: Center(
                      child: Text("Forgot Your Password?",
                          style: TextStyle(
                              color: Colors.black, fontSize: height * 0.019)),
                    )),
                SizedBox(
                  height: height * 0.12,
                ),
                Container(
                  height: height * 0.04,
                  //width: width,
                  child: Row(
                    children: [
                      Container(
                        width: width * 0.33,
                        padding: EdgeInsets.all(width * 0.025),
                        child: Center(
                          child: Container(
                            height: height * 0.001,
                            width: width * 0.25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                          width: width * 0.33,
                          child: Center(
                            child: Text(
                              "or Sign In with",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: height * 0.02),
                            ),
                          )),
                      Container(
                        width: width * 0.33,
                        padding: EdgeInsets.all(width * 0.025),
                        child: Center(
                          child: Container(
                            height: height * 0.001,
                            width: width * 0.25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.12,
                  width: width,
                  //color: Colors.pinkAccent,
                  child: Center(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipOval(
                              child: Material(
                                color: Colors.white, // Button color
                                child: InkWell(
                                  splashColor: Colors.red, // Splash color
                                  onTap: () {},
                                  child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Image.network(
                                          "https://freesvg.org/img/1534129544.png")),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipOval(
                              child: Material(
                                color: Colors.white, // Button color
                                child: InkWell(
                                  splashColor: Colors.red, // Splash color
                                  onTap: () {},
                                  child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Image.network(
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/768px-Facebook_Logo_%282019%29.png")),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
