import 'package:flutter/material.dart';
import 'package:flutter_nearby_places/models/place_model.dart';
import 'package:flutter_nearby_places/services/place_service.dart';

class PlacesScreen extends StatefulWidget {
  @override
  _PlacesScreenState createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Nearby Places"),
        ),
        body: _createContent(),
      ),
    );
  }

  Widget _createContent() {
    if (_places == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView(
        children: _places.map((e) {
          return Card(
            child: ListTile(
              title: Text(e.name),
              leading: Image.network(e.icon),
              subtitle: Text(e.vicinity),
              trailing: Column(
                children: [
                  Icon(Icons.star_border, color: Colors.deepOrangeAccent,),
                  Text(e.rating)
                ],
              ),
            ),
          );
        }).toList(),
      );
    }
  }

  List<Place> _places;

  @override
  void initState() {
    super.initState();

    PlacesService.get().getNearbyPlaces().then((value) {
      this.setState(() {
        _places = value;
      });
    }).catchError((error)=> print(error));
  }
}
