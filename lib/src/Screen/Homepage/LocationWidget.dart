import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  late GoogleMapController mapController;
  BitmapDescriptor? pinLocationIcon;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    // TODO: implement initState
    // findLatLng();
    super.initState();
  }


  Future<Null> findLatLng() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.5),
        'assets/images/logomark.png');
  }

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    var size = MediaQuery.of(context).size;
    return Container(
      width: 200,
      height: 200,
      color: const Color.fromRGBO(54, 52, 53, 1),
      child: GoogleMap(
        markers: myMarker(),
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: LatLng(17.964569127655977, 102.60421459482328),
          zoom: 15.0,
        ),
      ),
    );
  }

  Set<Marker> myMarker() {
    return <Marker>[
      Marker(
        onTap: () async{
          await launchUrl(Uri.parse("https://www.google.com/maps/place/The+Barber+Lao+%E0%BA%AA%E0%BA%B2%E0%BA%82%E0%BA%B2+%E0%BB%81%E0%BA%84%E0%BA%A1%E0%BA%82%E0%BA%AD%E0%BA%87/@17.9643441,102.6041947,46m/data=!3m1!1e3!4m14!1m7!3m6!1s0x3124699ceea059c7:0x3dd1bec1ad7f27e!2zVGhlIEJhcmJlciBMYW8g4Lqq4Lqy4LqC4LqyIOC7geC6hOC6oeC6guC6reC6hw!8m2!3d17.964314!4d102.6042146!16s%2Fg%2F11fmfkq8rn!3m5!1s0x3124699ceea059c7:0x3dd1bec1ad7f27e!8m2!3d17.964314!4d102.6042146!16s%2Fg%2F11fmfkq8rn?entry=ttu"));
        },
        markerId: MarkerId('myShop'),
        icon: BitmapDescriptor.defaultMarker,
        position:  LatLng(17.964569127655977, 102.60421459482328),
        infoWindow: InfoWindow(title: 'The barber Lao', snippet: '17.964569127655977 - 102.60421459482328'),
      )
    ].toSet();
  }
}
