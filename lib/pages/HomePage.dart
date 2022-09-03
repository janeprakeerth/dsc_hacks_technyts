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

  Future<bool> getDistance(double lat, double long) async {
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
      return false;
    } else {
      print("returned trueeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      return true;
    }
  }


  var selected_num = 0;
  List<QueryDocumentSnapshot> alldata = [];
  @override
  void initState() {
    FirebaseFirestore.instance
        .collection('ambulances')
        .snapshots()
        .forEach((element) {
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
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text("Home Page"),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('ambulances').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              return ListView(
                children: snapshot.data!.docs.map((document) {
                  var longitude = document["longitude"];
                  var latitude = document["latitude"];
                  print(alldata);
                    return Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0 , right: 10.0 , top: 30.0),
                            child: Container(
                              height: deviceHeight * 0.1,
                              width: deviceWidth*0.8,

                              decoration: BoxDecoration(color: AppColors.mainColor,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(25.0) ,topLeft: Radius.circular(25.0)),),

                              child: Column(

                                children: [
                                  Container(
                                    height: deviceHeight*0.05,
                                    width: deviceWidth*0.8,

                                    child: Row(


                                      children: [
                                        SizedBox(width: deviceWidth*0.07,),
                                        Text("Book Ambulance" , style: TextStyle(
                                            color: Colors.white , fontSize: deviceHeight*0.02
                                        ),),
                                        SizedBox(width: deviceWidth*0.25,),
                                        IconButton(onPressed: (){}, icon: Icon(Icons.wysiwyg_outlined ,
                                          color: Colors.white,))
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [SizedBox(width: deviceWidth*0.08,),
                                      Container(height: deviceHeight*0.05,

                                        child: Align(alignment : Alignment.topLeft,child: Text("Hospital name" , style: TextStyle(color: Colors.white),)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0 , right: 30.0 ),
                            child: Container(
                              height: deviceHeight*0.2,
                              width: deviceHeight*0.8 ,


                    decoration: BoxDecoration(
                      color: Color(0xFFf5f4ed),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25) , bottomRight: Radius.circular(25) ,),
                    ),
                              child: Column(
                                children: [
                                  SizedBox(height: deviceHeight*0.01,),
                                  Row(
                                  children: [
                                    SizedBox(width: deviceWidth*0.07,),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child:
                                      Image.network('https://googleflutter.com/sample_image.jpg' , height: 60.0,width: 60.0,),
                                    ),
                                    SizedBox(width: deviceWidth*0.03,),
                                    Column(children: [
                                        Align(child: Text("Peterson"  ,style : TextStyle(color: Colors.black , fontSize: deviceHeight*0.025 , fontWeight: FontWeight.bold)),alignment: Alignment.centerLeft,),
                                        Align(child: Text("Peterson"  ,style : TextStyle(color: Colors.black , fontSize: deviceHeight*0.020 , fontWeight: FontWeight.bold)) , alignment: Alignment.centerLeft,),
                                                ],
                                    ),
                                    SizedBox(width: deviceWidth*0.18,),
                                    Icon(Icons.info_outline_rounded , color: Colors.black,)

                                  ],

                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25.0),
                                    child: Container(

                      decoration: BoxDecoration(
                        color: AppColors.mainColor,

                        borderRadius: BorderRadius.circular(10.0)

                                    ),
                                      height: deviceHeight*0.04,
                                      width: deviceWidth*0.4,

                                      child : Center(child: Text("Book Ambulance",
                                      style: TextStyle(
                                        color: Colors.white , fontWeight: FontWeight.bold,
                                         fontSize: deviceHeight*0.018
                                      ),)),
                                    ),
                                  )
                              ],
                                )
                              ),
                          ),

                        ],
                      ),
                    );
                }).toList(),
              );
            }
          },
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
