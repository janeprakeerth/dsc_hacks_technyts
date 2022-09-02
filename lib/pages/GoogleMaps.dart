import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_hacks_technyts/pages/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils/colors.dart';

class GoogleMaps extends StatefulWidget {
  final String name_of_hospital;
  final String name_of_driver;
  final String driver_mobile_number;
  final String vehicle_number;
  final String hosptal_address;
  const GoogleMaps(
      {Key? key,
      required this.name_of_hospital,
      required this.name_of_driver,
      required this.driver_mobile_number,
      required this.vehicle_number,
      required this.hosptal_address})
      : super(key: key);

  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  Type googleMapController = GoogleMapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Type position = Position;
  double latitude = 0;
  double longitude = 0;

  void getMarkers(double lat, double long) {
    MarkerId markerId = MarkerId(lat.toString() + long.toString());
    Marker _marker = Marker(
        markerId: markerId,
        position: LatLng(lat, long),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
        infoWindow: InfoWindow(snippet: 'Address'));
    setState(() {
      markers[markerId] = _marker;
    });
  }

  void getCurrentLocation() async {
    Position currentPosition =
        await GeolocatorPlatform.instance.getCurrentPosition();
    setState(() {
      position = currentPosition as Type;
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text(
          "Point Your Hospital in the map",
          style: TextStyle(fontSize: 16),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: deviceHeight / 1.26,
              child: Container(
                margin: EdgeInsets.only(
                    left: deviceWidth / 24,
                    right: deviceWidth / 24,
                    top: deviceWidth / 24),
                child: GoogleMap(
                  onTap: (tapped) async {
                    latitude = tapped.latitude;
                    longitude = tapped.longitude;
                    getMarkers(tapped.latitude, tapped.longitude);
                  },
                  mapType: MapType.hybrid,
                  compassEnabled: true,
                  trafficEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    setState(() {
                      googleMapController = controller as Type;
                    });
                  },
                  initialCameraPosition: CameraPosition(
                      target: LatLng(12.815330, 80.041618), zoom: 15.0),
                  markers: Set<Marker>.of(markers.values),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                try {
                  CollectionReference ambulance =
                      await FirebaseFirestore.instance.collection("ambulances");
                  await ambulance.add({
                    'hospital_name': widget.name_of_hospital,
                    'driver_name': widget.name_of_driver,
                    'driver_mobile_number': widget.driver_mobile_number,
                    'vehicle_number': widget.vehicle_number,
                    'hospital_address': widget.hosptal_address,
                    'latitude': latitude.toString(),
                    'longitude': longitude.toString(),
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                } catch (error) {
                  print(error.toString());
                }
                print("Ambulance added");
              },
              child: Container(
                width: deviceWidth,
                height: deviceHeight / 15.12,
                margin: EdgeInsets.only(
                    left: deviceWidth / 9,
                    right: deviceWidth / 9,
                    top: deviceWidth / 30),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(deviceHeight / 37.8),
                ),
                child: Center(
                  child: Text(
                    "Submit",
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
