import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../ui/widget/custom_error_dialog.dart';
import '../constants/strings.dart';
import '../repository/network_repository.dart';

/// Provider class for location data
class LocationProvider extends ChangeNotifier {
  LatLng currentLatLng = const LatLng(0.0, 0.0);
  GoogleMapController? _mapController;
  LatLng geoFenceLatLng = const LatLng(0.0, 0.0);
  Polygon? polygon;

  /// Method to set map controller
  void setMapController(GoogleMapController controller) {
    _mapController = controller;
  }

  /// Method to update camera position on particular location on map
  void updateCameraPosition(LatLng target) {
    _mapController?.animateCamera(CameraUpdate.newLatLng(target));
  }

  /// Method to fetch current location & store in currentLatLng variable
  Future<void> getCurrentLocation(BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (context.mounted) {
          showErrorDialog(Strings.locationPermissionError, context);
        }
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentLatLng = LatLng(position.latitude, position.longitude);
    notifyListeners();
    updateCameraPosition(currentLatLng);
  }

  /// Method to fetch building coordinates and draw geofence
  Future<void> fetchBuildingCoordinates(BuildContext context, LatLng targetLatLng) async {
    final networkRepository = NetworkRepository();
    final apiResponse = await networkRepository.checkBuildingAndFetchCoordinates(targetLatLng);
    if (apiResponse is String) {
      showErrorDialog(apiResponse, context);
    } else {
      polygon = Polygon(
        polygonId: const PolygonId('square_polygon'),
        points: apiResponse as List<LatLng>,
        strokeColor: Colors.black,
        strokeWidth: 2,
        fillColor: Colors.black.withOpacity(0.5),
      );
      _calculatePolygonCenter(apiResponse);
      notifyListeners();
    }
  }

  void _calculatePolygonCenter(List<LatLng> list) {
    double totalLat = 0;
    double totalLng = 0;
    final corners = list;
    for (var point in corners) {
      totalLat += point.latitude;
      totalLng += point.longitude;
    }

    double centerLat = totalLat / corners.length;
    double centerLng = totalLng / corners.length;

    geoFenceLatLng = LatLng(centerLat, centerLng);
  }
}
