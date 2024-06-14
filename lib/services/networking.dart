import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'location.dart';

class NetworkHelper {
  Uri url(String latitude, String longitude) {
    return Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': latitude,
      'lon': longitude,
      'appid': '7839ab96fd8f50b8bc3a2d21116a90ef',
      'units': 'metric'
    });
  }

  Uri urlByName(String cityName) {
    return Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'q': cityName,
      'appid': '7839ab96fd8f50b8bc3a2d21116a90ef',
      'units': 'metric'
    });
  }

  Future<dynamic> getData() async {
    Location l = Location();
    Position position = await l.getCurrentLocation();

    Response res = await get(
        url(position.latitude.toString(), position.longitude.toString()));
    String Data = res.body;
    if (res.statusCode == 200) {
      return jsonDecode(Data);
    } else {
      print(res.statusCode);
    }
  }

  Future<dynamic> getDataByName(String cityName) async {
    Response res = await get(urlByName(cityName));
    String Data = res.body;
    if (res.statusCode == 200) {
      return jsonDecode(Data);
    } else {
      print(res.statusCode);
    }
  }
}
