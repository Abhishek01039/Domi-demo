import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../core/constants/image_assets.dart';
import '../../core/constants/strings.dart';
import '../../core/providers/invite_provider.dart';
import '../../core/providers/location_provider.dart';
import '../../routes.dart';
import '../widget/circular_icon_widget.dart';
import '../widget/custom_loader.dart';
import '../widget/custom_marker.dart';
import '../widget/invite_dialog.dart';
import 'detail_screen.dart';

/// Class to load map screen & layout
/// Initial/Home screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

/// State widget of home screen
class _HomeScreenState extends State<HomeScreen> {
  late BitmapDescriptor markerIcon;

  /// Method who called very first to init state
  @override
  void initState() {
    super.initState();
    init();
  }

  BitmapDescriptor? geofenceMarker;

  /// Method to load icon and fetch current location when page called
  Future<void> init() async {
    markerIcon = await _getBitmapDescriptorFromAssetBytes(ImageAssets.buildingImage, 100);
    geofenceMarker = await _getMarkerIcon();
    Provider.of<LocationProvider>(context, listen: false).getCurrentLocation(context);
  }

  /// Build method to load ui
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<LocationProvider>(builder: (context, provider, child) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            provider.currentLatLng.latitude == 0.0
                ? CustomLoader()
                : GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(target: provider.currentLatLng, zoom: 14.0),
                    markers: {
                      _getMarker(provider.currentLatLng),
                      if(geofenceMarker!= null)
                        _getGeoMarker(provider.geoFenceLatLng)
                    },
                    onMapCreated: (GoogleMapController controller) {
                      provider.setMapController(controller);
                    },
                    onTap: (LatLng value) {
                      Provider.of<InviteProvider>(context, listen: false).updateInviteDialogVisibility(true);
                      provider.fetchBuildingCoordinates(context, value);
                    },
              polygons: provider.polygon == null ? {} : {provider.polygon!},
            ),
            _topWidget(),
            _bottomSheet(),
            Consumer<InviteProvider>(
              builder: (ct, value, child) {
                return value.showInviteDialog ? const InviteDialog() : const SizedBox();
              },
            ),
          ],
        );
      }),
    );
  }

  /// Method to return top widget
  Widget _topWidget() {
    return Positioned(
      left: 0,
      right: 0,
      top: MediaQuery.of(context).padding.top + 16,
      child: Row(
        children: [
          const SizedBox(width: 16.0),
          InkWell(
            onTap: () => Navigator.of(context).pushNamed(Routes.profileScreen),
            child: const CircularIconWidget(widget: Icon(Icons.account_circle_outlined, color: Colors.white)),
          ),
          const Expanded(child: SizedBox()),
          _centerTitleWidget(),
          const Expanded(child: SizedBox()),
          InkWell(
            onTap: ()=> Navigator.of(context).pushNamed(Routes.messageScreen),
            child: const CircularIconWidget(widget: Icon(Icons.message, color: Colors.white, size: 20)),
          ),
          const SizedBox(width: 16.0),
        ],
      ),
    );
  }

  /// Method to return center title widget
  Widget _centerTitleWidget() {
    return Container(
      height: 40,
      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20.0)),
      padding: EdgeInsets.all(4.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(19.0),
            child: Image.asset(ImageAssets.buildingImage, height: 32, width: 32),
          ),
          const SizedBox(width: 16.0),
          const Text(Strings.docTitle3, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          const SizedBox(width: 12.0),
        ],
      ),
    );
  }

  /// Method to return bottom sheet
  Widget _bottomSheet() {
    return Consumer<InviteProvider>(builder: (ct, value, child) {
      return value.showInviteDialog
          ? const SizedBox()
          : NotificationListener<DraggableScrollableNotification>(
              onNotification: (notification) {
                if (notification.extent == notification.minExtent) {
                  return true;
                } else {
                  return false;
                }
              },
              child: DraggableScrollableSheet(
                initialChildSize: 0.1,
                minChildSize: 0.1,
                maxChildSize: 1.0,
                expand: false,
                builder: (context, scrollController) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
                    ),
                    child: DetailScreen(scrollController: scrollController),
                  );
                },
              ),
            );
    });
  }

  /// Method to get market for map
  Marker _getMarker(LatLng currentLocation) {
    return Marker(
      markerId: const MarkerId("currentLocation"),
      position: currentLocation,
      icon: markerIcon,
    );
  }

  /// Method to get market on geo fence
  Marker _getGeoMarker(LatLng currentLocation) {
    return Marker(
      markerId: const MarkerId("currentLocation"),
      position: currentLocation,
      icon: geofenceMarker!,
    );
  }

  /// Method to get BitmapDescriptor from assets of marker icon
  Future<BitmapDescriptor> _getBitmapDescriptorFromAssetBytes(String path, int width) async {
    final data = await rootBundle.load(path);
    final codec = await instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    final frameInfo = await codec.getNextFrame();
    final byteData = await frameInfo.image.toByteData(format: ImageByteFormat.png);

    if (byteData == null) {
      throw Exception('Unable to convert image to byte data.');
    }

    return BitmapDescriptor.fromBytes(byteData.buffer.asUint8List());
  }

  /// Method to get custom widget marker icon
  Future<BitmapDescriptor?> _getMarkerIcon() async {
    return CustomMarker(
      key: GlobalKey(debugLabel: '${DateTime.now().millisecondsSinceEpoch}'),
      color: Colors.black,
      image: Image.asset(
        ImageAssets.buildingImage,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
    ).toBitmapDescriptor();
  }
}
