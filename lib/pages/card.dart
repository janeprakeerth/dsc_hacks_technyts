import 'package:flutter/material.dart';
class Card extends StatefulWidget {
  const Card({Key? key}) : super(key: key);

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
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
      ),
    );
  }

}


