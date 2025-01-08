import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../model/user_model.dart';

class ClientDetailsPage extends StatefulWidget {
  final Data clientData;

  ClientDetailsPage({required this.clientData});

  @override
  _ClientDetailsPageState createState() => _ClientDetailsPageState();
}

class _ClientDetailsPageState extends State<ClientDetailsPage> {
  late GoogleMapController mapController;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late LatLng currentLocation;
  final databaseReference = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    currentLocation = LatLng(37.4219983, -122.084);
    _updateLocationInFirebase();
    writeData();
  }

  void writeData() {
    databaseReference.child("users").push().set({
      'name': widget.clientData.name,
      'phone': widget.clientData.phone,
      'location': {
        'latitude': currentLocation.latitude,
        'longitude': currentLocation.longitude,
      },
    });
    listenToChanges();
  }

  void listenToChanges() {
    databaseReference.child("users").onValue.listen((event) {
      print('New Data: ${event.snapshot.value}');
    });
  }

  void _updateLocationInFirebase() async {
    firestore.collection('clients').doc(widget.clientData.userID).set({
      'name': widget.clientData.name,
      'phone': widget.clientData.phone,
      'location': {
        'latitude': currentLocation.latitude,
        'longitude': currentLocation.longitude,
      },
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Client Details'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${widget.clientData.name}',
                    style: TextStyle(fontSize: 18)),
                Text('Phone: ${widget.clientData.phone}',
                    style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          Expanded(
            child: GoogleMap(
              onCameraMove: (position) {
                setState(() {
                  currentLocation = LatLng(
                      position.target.latitude, position.target.longitude);
                });
                _updateLocationInFirebase();
                writeData();
              },
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: currentLocation,
                zoom: 15,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('clientLocation'),
                  position: currentLocation,
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
