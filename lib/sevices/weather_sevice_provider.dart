import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wetherapp/model/weather_model.dart';
import 'package:wetherapp/secreates/api.dart';
import 'package:http/http.dart' as http;

class weatherSeviceProvider extends ChangeNotifier {
  weatherModel? _weather;
  weatherModel? get weather => _weather;

  bool _isloading = false;
  bool get isloading => _isloading;

  String _error = "";
  String get error => _error;

  Future<void> featchWeatherDataCity(String city) async {
    _isloading = true;
    _error = '';


    try {
      final apiurl =
          "${ApiendPointes().cityurl}${city}&appid=${ApiendPointes().apikey}${ApiendPointes().unit}";
          print(apiurl);
      final respones = await http.get(Uri.parse(apiurl));
      if (respones.statusCode == 200) {
        final data = jsonDecode(respones.body);
        print(data);
        _weather = weatherModel.fromJson(data);
        notifyListeners();
      } else {
        _error = "failed to load the data";
      }
    } catch (e) {
      _error = "faild $e";
    } finally {
      _isloading = false;
      notifyListeners();
    }
  }
}
