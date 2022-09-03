import 'package:cloud_firestore/cloud_firestore.dart';

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
}
