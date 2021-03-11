import 'package:flutter/material.dart';
import 'package:tau_tracker/tracker_list.dart';

void main() => runApp(TauTracker());

class TauTracker extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Crypto Tracker",
      theme: ThemeData(
        primarySwatch: Colors.yellow
      ),
      home: TrackerList(),
    );
  }
}