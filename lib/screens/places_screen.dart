import 'package:flutter/material.dart';

class PlacesScreen extends StatefulWidget {
  @override
  _PlacesScreenState createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nearby Places"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("first item"),
            trailing: Icon(Icons.forward),
          ),
          ListTile(
            title: Text("first item"),
            trailing: Icon(Icons.forward),
          ),
        ],
      ),
    );
  }
}
