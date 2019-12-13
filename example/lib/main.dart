import 'package:flutter/material.dart';

import 'dart:ui';
import 'package:mapbox_flutter_plugin/mapbox_gl.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MapboxMapController _mapboxMapController;

  void onCreateMap(MapboxMapController controller){
    _mapboxMapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Stack(
          children: <Widget>[
            MapboxMap(
              initialCameraPosition: CameraPosition(
                zoom: 5,
                target: LatLng(39.911337,116.410625),
              ),
              myLocationEnabled: true,
              onMapCreated: onCreateMap,
            ),
            Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    _mapboxMapController.addSymbol(SymbolOptions(
                        title: 'a',
                        desc: 'as',
                        poiImage: 'sdf',
                        id: "7",
                        geometry: LatLng(39.911337,116.410625)
                    ));
                  },
                  child: Text('add symbol'),
                ),
                RaisedButton(
                  onPressed: () {
                    _mapboxMapController.addSymbolList([
                      SymbolOptions(
                          title: 'a',
                          desc: 'as',
                          poiImage: 'sdf',
                          id: "5",
                          geometry: LatLng(39.90502,116.393846)
                      ),
                      SymbolOptions(
                          title: 'a8',
                          desc: 'as',
                          poiImage: 'sdf',
                          id: "3",
                          geometry: LatLng(40.003649,116.326831)
                      )
                    ]);
                  },
                  child: Text('add symbol list'),
                ),
                RaisedButton(
                  onPressed: () {
                    _mapboxMapController.addLine(LineOptions(
                      lineColor: '#000000',
                        lineWidth: 1,
                        geometry: [LatLng(39.895054,116.396314),LatLng(39.903755,116.397724),LatLng(39.896591,116.398311)]
                    ));
                  },
                  child: Text('add line'),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}



//import 'dart:ui';
//
//import 'package:flutter/material.dart';
//import 'dart:async';
//
//import 'package:flutter/services.dart';
//import 'package:flutter_mapbox_gray/flutter_mapbox_gray.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//
//  var mapboxViewController;
//
//  @override
//  void initState() {
//    super.initState();
//
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//
//    var width = MediaQueryData.fromWindow(window).size.width;
//
//    var height = 300.0;
//
//    MapboxView mapboxView = new  MapboxView(
//      onCreated: onMapboxViewCreated,
//    );
//
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: const Text('Plugin example app'),
//        ),
//        body: Column(
//          children: <Widget>[
//            Container(
//              width: width,
//              height: height,
//              child: mapboxView,
//            ),
//            FloatingActionButton(
//              onPressed: onDrawline,
//            )
//          ],
//        )
//      ),
//    );
//  }
//
//
//  void onMapboxViewCreated(mapboxViewController){
//    this.mapboxViewController = mapboxViewController;
//  }
//
//
//  void onDrawline(){
//
//    Map point1 = {'latitude':39.899782,'longtitude':116.393386};
//    Map point2 = {'latitude':39.903755,'longtitude':116.397724};
//    Map point3 = {'latitude':39.939299,'longtitude':116.395628};
//    Map point4 = {'latitude':39.940442,'longtitude':116.355471};
//    Map point5 = {'latitude':39.908518,'longtitude':116.447093};
//
//    List points = [point1,point2,point3,point4,point5];
//
//
//    this.mapboxViewController.drawLineAction(LineItemData(points: points));
//  }
//
//
//}
//
//
