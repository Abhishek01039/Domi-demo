import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../ui/widget/custom_error_dialog.dart';
import '../constants/strings.dart';

/// Provider class for location data
class LocationProvider extends ChangeNotifier {
  LatLng currentLatLng = const LatLng(0.0, 0.0);
  GoogleMapController? _mapController;

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
}
