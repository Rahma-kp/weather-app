import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class locationprovider with ChangeNotifier {
  Position? _currentposition;
  Position? get currentpositio => _currentposition;

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
    notifyListeners();
  }
}
