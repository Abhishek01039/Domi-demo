import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../constants/strings.dart';

class NetworkRepository {
  /// Method to api call and return building coordinates
  Future<dynamic> checkBuildingAndFetchCoordinates(LatLng targetLatLng) async {
    // 1. Construct Overpass query
    const radius = 10; // Search radius in meters
    final query = """
      [out:json];
      (
        way["building"](around:$radius,${targetLatLng.latitude},${targetLatLng.longitude});
      );
      out body;
      >;
      out skel qt;
    """;

    // 2. Make API request
    final url =
        Uri.parse('https://overpass-api.de/api/interpreter?data=$query');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // 3. Process response and fetch building coordinates
      final jsonResponse = jsonDecode(response.body);
      final responseElements = jsonResponse['elements'] as List<dynamic>;

      if (responseElements.isEmpty) {
        return Strings.noDataForBuilding;
      }

      /// Fetch all lat lng available to draw fence
      Map<int, LatLng> buildingCoordinates = {};
      for (final element in responseElements) {
        if (element['type'] == 'node') {
          final latLng = LatLng(element['lat'], element['lon']);
          buildingCoordinates[element['id']] = latLng;
        }
      }

      /// Arranging all lat lng based on nodes
      final List<LatLng> latLngCoordinates = [];
      final nodes = responseElements[0]['nodes'] as List<dynamic>;
      for (final item in nodes) {
        latLngCoordinates.add(buildingCoordinates[item]!);
      }
      return latLngCoordinates;
    } else {
      return '${Strings.apiFailure} ${response.statusCode}';
    }
  }
}
