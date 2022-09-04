import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class databasemanger {
  Future getAmbulanceList() async {
    List ambulancelist = [];
    try {
      var ambulances =
          await FirebaseFirestore.instance.collection('ambulances').get();
      final allData = ambulances.docs.map((doc) => doc.data()).toList();
      ambulancelist = allData;
      return ambulancelist;
    } catch (error) {
      print("okokoko");
    }
  }

  Future getMybookingsList() async {
    List bookinglist = [];
    try {
      var booking =
      await FirebaseFirestore.instance.collection('bookings').where('userId' , isEqualTo: FirebaseAuth.instance.currentUser?.uid.toString()).get();
      final allData = booking.docs.map((doc) => doc.data()).toList();
      bookinglist = allData;
      return bookinglist;
    } catch (error) {
      print("okokoko");
    }
  }
}
