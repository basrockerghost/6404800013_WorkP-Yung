import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Mappage extends StatefulWidget {
  const Mappage({super.key});

  @override
  State<Mappage> createState() => _MappageState();
}

class _MappageState extends State<Mappage> {
  Completer<GoogleMapController> _controller = Completer();
  final CameraPosition position = CameraPosition(
    target: LatLng(12.772822883377035, 99.97470404594839), //
    zoom: 18,
  );
  _openGoogleMapApp(double lat, double long) async {
    Uri url =
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$long');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not lunch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Page'),
      ),
      body: GoogleMap(
        mapType: MapType.satellite,
        markers: <Marker>[
          Marker(
              markerId: MarkerId('marker1 เอง'),
              position: LatLng(12.772822883377035, 99.97470404594839),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRose),
              infoWindow:
                  InfoWindow(title: 'I am work at here', snippet: 'Hide out'),
              onTap: () {
                _openGoogleMapApp(13.788109303473627, 100.54863446761962);
              }),
        ].toSet(),
        initialCameraPosition: position,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
