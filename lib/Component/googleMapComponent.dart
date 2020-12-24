import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'package:register/Models/MarkerModel.dart';
import 'package:geocoder/geocoder.dart';

class googleMapComponent extends StatefulWidget {
  bool myLocation;
  bool route;
  bool displayCards;
  bool displayToolbar;
  bool mapRotate;
  bool enableZoom;
  double minZoom;
  double maxZoom;
  double widthMap;
  double heightMap;
  MapType mapType;
  LatLng center;
  Function(LatLng pos) OnPositionChangeCallback;
  Function(Marker marker) OnMarkerAddCallback;
  Function(Marker marker) OnMarkerRemoveCallback;
  Function(LatLng origin, LatLng target) OnComplateRouteCallback;
  Function(LatLng my) OnMyLocationCallback;
  Function(LatLng touched) OnTouchedLocationCallback;

  googleMapComponent({
    this.myLocation,
    this.OnComplateRouteCallback,
    this.OnMarkerAddCallback,
    this.OnMarkerRemoveCallback,
    this.OnMyLocationCallback,
    this.OnPositionChangeCallback,
    this.OnTouchedLocationCallback,
    this.center,
    this.displayCards,
    this.displayToolbar,
    this.mapRotate,
    this.mapType,
    this.maxZoom,
    this.minZoom,
    this.route,
    this.enableZoom,
    this.heightMap,
    this.widthMap,
  });

  @override
  _googleMapComponentState createState() => _googleMapComponentState();
}

class _googleMapComponentState extends State<googleMapComponent> {
  static LatLng origin = null;
  static LatLng target = null;
  static Set<Marker> markers = {};

  GoogleMapController controller;
  Location locationTracker = Location();
  StreamSubscription locationSubscription;
  LatLng lastMapPosition = LatLng(45.521563, -122.677433);

  void _onAddMarkerButtonPressed() {
    if (origin == null) {
      origin = lastMapPosition;
    } else {
      target = lastMapPosition;
    }
//
//    final coordinates =  Coordinates(lastMapPosition.latitude , lastMapPosition.longitude);
//    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
//    var first = addresses.first;

    setState(() {
      markers.add(Marker(
        markerId: MarkerId(lastMapPosition.toString()),
        position: lastMapPosition,
        icon: BitmapDescriptor.defaultMarker,
      ));
    });

    markerList.add(MarkerModel(
      name: DateTime.now().microsecondsSinceEpoch.toString(),
      place: lastMapPosition,
      url:
      'https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg',
    ));
  }

  void onCameraMove(CameraPosition position) {
    lastMapPosition = position.target;
  }

  void onMapCreated(GoogleMapController _controller) {
    controller = _controller;
  }

  void deleteMarker() {
    markers.clear();
    markerList.clear();

    setState(() {});
  }

  Widget locationOn() {
    if (origin == null) {
      return Icon(
        Icons.location_on,
        color: Colors.red,
        size: 55.0,
      );
    } else
      return Icon(
        Icons.location_on,
        color: Colors.blue,
        size: 55.0,
      );
  }

  void getCurrentLocation() async {
    try {
//      Uint8List imageData = await getMarker();
      var location = await locationTracker.getLocation();

//      updateMarkerAndCircle(location, imageData);

      if (locationSubscription != null) {
        locationSubscription.cancel();
      }

      locationSubscription =
          locationTracker.onLocationChanged.listen((newLocalData) {
            if (widget.OnMyLocationCallback != null) {
              widget.OnMyLocationCallback(
                  LatLng(newLocalData.latitude, newLocalData.longitude));
            }
            if (controller != null) {
              controller.animateCamera(CameraUpdate.newCameraPosition(
                  new CameraPosition(
                      bearing: 192.8334901395799,
                      target: LatLng(newLocalData.latitude, newLocalData.longitude),
                      tilt: 0,
                      zoom: 18.00)));
//          updateMarkerAndCircle(newLocalData, imageData);
            }
          });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  void dispose() {
    if (locationSubscription != null) {
      locationSubscription.cancel();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          GoogleMap(
            ////Secret Ingridient to possible scrolling of google map on SingleChildScrollView
            gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
              new Factory<OneSequenceGestureRecognizer>(
                    () => new EagerGestureRecognizer(),
              ),
            ].toSet(),
            ///////

            compassEnabled: false,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
            mapToolbarEnabled: true,
            onMapCreated: onMapCreated,
            initialCameraPosition: CameraPosition(
              target: widget.center ?? LatLng(35.0, 51.0),
              zoom: 11.0,
            ),
            minMaxZoomPreference: MinMaxZoomPreference(
                widget.minZoom ?? 1, widget.maxZoom ?? 1000),
            rotateGesturesEnabled: widget.mapRotate ?? false,
            zoomControlsEnabled: widget.enableZoom ?? false,
            mapType: widget.mapType ?? MapType.normal,
            markers: markers,
            onCameraMove: onCameraMove,
            onLongPress: (argument) {
              // pending
            },
            onTap: (argument) {
              // pending
            },
          ),
          /////////////////////MARKER
          Padding(
            padding: EdgeInsets.only(bottom: 55.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  _onAddMarkerButtonPressed();
                },
                child: locationOn(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  // FloatingActionButton(
                  //   onPressed: () {
                  //     _onAddMarkerButtonPressed();
                  //   },
                  //   materialTapTargetSize: MaterialTapTargetSize.padded,
                  //   backgroundColor: Colors.green,
                  //   child: const Icon(Icons.add_location, size: 36.0),
                  // ),
                  // SizedBox(
                  //   height: 16.0,
                  // ),
                  // FloatingActionButton(
                  //   onPressed: () {
                  //     deleteMarker();
                  //   },
                  //   materialTapTargetSize: MaterialTapTargetSize.padded,
                  //   backgroundColor: Colors.red,
                  //   child: Icon(Icons.delete),
                  // ),
                  // SizedBox(
                  //   height: 16.0,
                  // ),
                  Visibility(
                    visible: widget.myLocation ?? false,
                    maintainState: true,
                    maintainAnimation: true,
                    maintainSize: true,
                    child: IconButton(
                      onPressed: () {
                        getCurrentLocation();
                      },
                      icon: Icon(
                        Icons.location_searching_outlined,
                        color: Colors.black,
                        size: 35.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomLeft,
          //   child: Container(
          //     margin: EdgeInsets.symmetric(vertical: 20.0),
          //     height: 100,
          //     child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: markerList.length,
          //       padding: EdgeInsets.symmetric(horizontal: 20),
          //       itemBuilder: (BuildContext, int index) {
          //         return _boxes(index);
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Future<void> gotoLocation(double lat, double long) async {
//    final GoogleMapController controller = await controller;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }

  Widget _boxes(int index) {
    return GestureDetector(
      onTap: () {
        gotoLocation(markerList[index].place.latitude,
            markerList[index].place.longitude);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          bottomLeft: Radius.circular(24)),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(markerList[index].url),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(markerList[index].name),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

Widget myDetailsContainer1(String restaurantName) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.all(50),
        child: Container(
            child: Text(
              restaurantName,
              style: TextStyle(
                  color: Color(0xff6200ee),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            )),
      ),
    ],
  );
}
