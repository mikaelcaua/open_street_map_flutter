import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';
import '../models/named_marker_model.dart';
import '../repositories/geolocator_repository.dart';

class HomeViewModel extends ChangeNotifier {
  List<NamedMarkerModel> namedMarkers = [];
  final GeolocatorRepository _locationRepository = GeolocatorRepository();
  LatLng? currentLocation;

  Future<void> initCurrentLocation() async {
    final location = await _locationRepository.getCurrentLocation();
    if (location != null) {
      currentLocation = location;
      notifyListeners();
    }
  }

  void addMarker(NamedMarkerModel marker) {
    namedMarkers.add(marker);
    notifyListeners();
  }

  void removeMarker(NamedMarkerModel marker) {
    namedMarkers.remove(marker);
    notifyListeners();
  }
}
