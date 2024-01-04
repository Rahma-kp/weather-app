import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wetherapp/sevices/location_screvice.dart';

class locationProvider with ChangeNotifier {
  Position? _currentposition;
  Position? get currentposition => _currentposition;
  final locationService  _locationservice=locationService();
  Placemark? _currentLocationName;
  Placemark? get currentLocationName=>_currentLocationName;

  Future<void> determineposition() async {
    bool seviceEnabled;
    LocationPermission permission;
    seviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!seviceEnabled) {
      _currentposition = null;
      notifyListeners();
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _currentposition = null;
        notifyListeners();
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      _currentposition = null;
      notifyListeners();
      return;
    }
    _currentposition = await Geolocator.getCurrentPosition();
    print(_currentposition);
    _currentLocationName=await _locationservice.getLocationName(_currentposition);
    print(_currentLocationName);
    notifyListeners();
  }
}
