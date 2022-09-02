import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils/colors.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({Key? key}) : super(key: key);

  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  Type googleMapController = GoogleMapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Type position = Position;
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
        title: Text("  Point Your Hospital in the map"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: deviceHeight / 1.26,
              child: GoogleMap(
                onTap: (tapped) async {
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
            )
          ],
        ),
      ),
    );
  }
}
