import 'dart:async';
import 'dart:convert';

import 'package:flutter_nearby_places/models/place_model.dart';
import 'package:http/http.dart' as http;

class PlacesService {
  static final _service = PlacesService();

  static PlacesService get(){
    return _service;
  }

  final String searchUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&types=food&name=harbour&key=AIzaSyDhjfDA7KRJ0mLUVG0mfdbQwXM_gZdYU3I";

  Future<List<Place>> getNearbyPlaces() async{

    var response = await http.get(searchUrl, headers:{"Accept":"application/json"}).catchError((error) => print(error));
    var places = <Place>[];

    List data = json.decode(response.body)['results'];

    data.forEach((element) {
      places.add(Place(icon: element['icon'], name: element['name'], rating: element['rating'].toString(), vicinity: element['vicinity'], id: element['place_id']));
    });
    return places;
  }

}