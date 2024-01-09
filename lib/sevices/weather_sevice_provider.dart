import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:wetherapp/model/weather_model.dart';
import 'package:wetherapp/secreats/api.dart';

class WeatherServiceProvider extends ChangeNotifier {
  WeatherModel? _weather;
  WeatherModel? get weather => _weather;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _error = '';
  String get error => _error;
  TextEditingController searchController = TextEditingController();

  Future<void> fetchWeatherDataByCity(String city, context) async {
    _isLoading = true;
    _error = '';
    try {
      final String apiUrl =
          '${ApiEndPointes().cityurl}${city}&appid=${ApiEndPointes().apikey}${ApiEndPointes().unit}';

      print(apiUrl);
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('$data');
        _weather = WeatherModel.fromJson(data);
        notifyListeners();
      } else {
        final snackBar = SnackBar(
            backgroundColor: Colors.red, content: Text("City not found"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        _error = 'Failed to load data';
        print(_error);
      }
    } catch (e) {
      _error = 'Error to load data$e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

