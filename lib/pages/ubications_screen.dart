import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ju_unpa_app/models/gimnasio.dart';
import 'package:ju_unpa_app/models/locationModel.dart';
import 'package:ju_unpa_app/pages/maps_screen.dart';
import 'package:ju_unpa_app/service/locationService.dart';
import 'package:location/location.dart';

import 'dart:math' as math;

class UbicationScreen extends StatefulWidget {
  @override
  _UbicationScreen createState() => _UbicationScreen();
}

class _UbicationScreen extends State<UbicationScreen> {
  LatLng? startPosition = const LatLng(-46.447975778904144, -67.51982599155225);

  List<locationModel> locations = [];
  List<Gimnasio> gimsList = [];
  List<Gimnasio> gimsList2 = [];

  bool _isLoading = false;
  Gimnasio gim1 = Gimnasio(
      id: 1,
      nombre: "Gimnasio Mosconi",
      position: const LatLng(-46.4422747914859, -67.5313492998305));
  Gimnasio gim2 = Gimnasio(
      id: 2,
      nombre: "Complejo Deportivo",
      position: const LatLng(-46.44197235116889, -67.51084916147663));

  Future<void> getLocation() async {
    final res = await locationService.getlocationList();

    if (res.error != null) {
      setState(() {
        //_isLoading = false;
        print(res.error! + ' en locations');
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      locations = res.success;

      print(locations);
    }
  }

  Location location = Location();

  @override
  void initState() {
    getLocation();
    getCorrentLocation();
    gimsList.add(gim1);
    gimsList.add(gim2);
    // getDistance(startPosition!.latitude, startPosition!.longitude,
    //     endPosition.latitude, endPosition.longitude);
    // TODO: implement initState
    super.initState();
  }

  //calcular la distancia entre ubicacion y destino
  double getDistance(lat1, lon1, lat2, lon2) {
    var R = 6371; // Radius of the earth in km
    var dLat = deg2rad(lat2 - lat1);
    var dLon = deg2rad(lon2 - lon1);
    var a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(deg2rad(lat1)) *
            math.cos(deg2rad(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    var c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    var d = R * c; // Distance in km
    var result = d * 1000;
    print(result.toString());
    return result; //in m
  }

  dynamic deg2rad(deg) {
    return deg * (math.pi / 180);
  }

  Future<LocationData> getCorrentLocation() async {
    var locationData = await location.getLocation();
    startPosition = LatLng(locationData.latitude!, locationData.longitude!);

    return locationData;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * .11,
            decoration: const BoxDecoration(
              color: Color.fromARGB(220, 39, 90, 90),
              image: DecorationImage(
                  alignment: Alignment.bottomCenter,
                  image: AssetImage("assets/images/baner02.png"),
                  opacity: 0.8,
                  scale: 5.0),
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Builder(
                        builder: (context) => IconButton(
                              icon: const Icon(
                                Icons.clear_all,
                                color: Colors.white,
                                size: 34,
                              ),
                              onPressed: () =>
                                  Scaffold.of(context).openDrawer(),
                            )),
                    const Text(
                      "UBICACIONES",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: AutofillHints.birthday,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ListView.builder(
                        // itemCount: gimsList.length,
                        itemCount: locations.length,
                        itemBuilder: (context, index) {
                          return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(220, 39, 90, 90)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MapScreen(
                                              startPosition: startPosition,
                                              endPosition:
                                                  //gimsList[index].position,
                                                  LatLng(
                                                      locations[index].latitude,
                                                      locations[index]
                                                          .longitude),
                                              distance: getDistance(
                                                  startPosition!.latitude,
                                                  startPosition!.longitude,
                                                  // gimsList[index]
                                                  //     .position
                                                  //     .latitude,
                                                  // gimsList[index]
                                                  //     .position
                                                  //     .longitude
                                                  locations[index].latitude,
                                                  locations[index].longitude),
                                            )));
                              },
                              child: Text(
                                // gimsList[index].nombre,
                                locations[index].name,
                                style: TextStyle(color: Colors.white),
                              ));
                        }),
                  ),
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
