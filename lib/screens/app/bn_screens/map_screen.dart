import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({Key? key}) : super(key: key);


  @override
  Widget build(context) {
    return const MaterialApp(
      title: 'Flutter Google Maps Demo',
      debugShowCheckedModeBanner: false,
      home: MapScreen(),
    );
  }
}


class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => MapSampleState();
}


class MapSampleState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.518954,34.444520),
    zoom: 14,

  );

  void selectImage(context) {
    Navigator.of(context).pushNamed(
        '/category_tripe_screen',
    );
  }
  static final Marker _kGooglePlexMarker = Marker(
    markerId: const MarkerId('first position'),
   infoWindow:const InfoWindow(title: 'first position',),
    icon: BitmapDescriptor.defaultMarker,
    position:const LatLng(31.518954,34.444520),//لتحدي
      onTap: (){}
      );


  static const CameraPosition position =  CameraPosition(
      bearing: 50.1555,
      target: LatLng(31.52972,34.44455),
      tilt: 59.440717697143555,
      zoom: 19.15192604069414);

  static final Marker secondMarker = Marker(
    markerId: const MarkerId('Second'),
    infoWindow: const InfoWindow(title: 'Second position'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    position: const LatLng(31.52972,34.44455),


  );
  static const Marker thirdMarker = Marker(
    markerId: MarkerId('Third position'),
    infoWindow: InfoWindow(title: 'Third position'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(31.52782,34.43820),//لتحديد المكان
  );

  static const Marker fourthMarker = Marker(
    markerId: MarkerId('FourthMarker position'),
    infoWindow: InfoWindow(title: 'FourthMarker position'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(31.52812,34.45237),//لتحديد المكان
  );
  static const Marker fifthMarker = Marker(
    markerId: MarkerId('FifthMarker position'),
    infoWindow: InfoWindow(title: 'FifthMarker position'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(31.51845,34.45506),//لتحديد المكان
  );

  static const Marker sixthMarker = Marker(
    markerId: MarkerId('SixthMarker position'),
    infoWindow: InfoWindow(title: 'SixthMarker position'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(31.51496,34.42766),//لتحديد المكان
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        markers:{_kGooglePlexMarker,secondMarker,thirdMarker,fourthMarker,fifthMarker,sixthMarker},
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);

        },
      ),

      floatingActionButton: FloatingActionButton.extended(
          onPressed: _goToTheLocation,
          label: const Text('Location'),
          icon: const Icon(Icons.directions),
        isExtended: false,


      ),
    );
  }
  Future<void> _goToTheLocation() async{
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(position));
  }
}
