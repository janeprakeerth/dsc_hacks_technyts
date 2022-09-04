import 'package:flutter/material.dart';
class mybookingsCard extends StatefulWidget {
  const mybookingsCard({Key? key}) : super(key: key);

  @override
  State<mybookingsCard> createState() => _mybookingsCardState();
}

class _mybookingsCardState extends State<mybookingsCard> {



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width =  MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height*0.2,

      ),
    );
  }
}
