import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Location {
  double latitude = 0;
  double longitude = 0;

  Future<Position> getCurrentLocation() async {
    Completer<Position> completer = Completer();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print(position.longitude);
      completer.complete(position);
    } catch (e) {
      print(e);
      completer.complete(null);
    }
    return completer.future;
  }
}
