import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:ui';



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
                zoom: 11,
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
                        id: 2,
                        geometry: LatLng(32,23)
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
                          id: 2,
                          geometry: LatLng(32,23)
                      ),
                      SymbolOptions(
                          title: 'a',
                          desc: 'as',
                          poiImage: 'sdf',
                          id: 2,
                          geometry: LatLng(32,23)
                      )
                    ]);
                  },
                  child: Text('add symbol list'),
                ),
                RaisedButton(
                  onPressed: () {
                    _mapboxMapController.addLine(LineOptions(
                        geometry: [LatLng(32,23)]
                    ));
                  },
                  child: Text('add line'),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
