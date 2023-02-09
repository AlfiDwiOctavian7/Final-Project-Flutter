import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationViws extends StatefulWidget {
  const LocationViws({Key? key}) : super(key: key);

  @override
  State<LocationViws> createState() => _LocationViwsState();
}

class _LocationViwsState extends State<LocationViws> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Text('location'),
      ),
    );
  }
}
