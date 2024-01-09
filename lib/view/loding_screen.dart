import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:wetherapp/sevices/location_provider.dart';
import 'package:wetherapp/sevices/weather_sevice_provider.dart';
import 'package:wetherapp/view/home.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    determineLocationAndFetchWeather(context);
  }

  void determineLocationAndFetchWeather(context) async {
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);

    await locationProvider.determineposition();

    if (locationProvider.currentLocationName != null) {
      var city = locationProvider.currentLocationName!.locality;
      if (city != null) {
        Provider.of<WeatherServiceProvider>(context, listen: false)
            .fetchWeatherDataByCity(city, context);
      }
      goToHome();
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text("Location Error"),
          content: Text(
              "Please ensure you have an internet connection and location services enabled."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                determineLocationAndFetchWeather(context);
              },
              child: Text('Try Again'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                SystemNavigator.pop();
              },
              child: Text('Close'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> goToHome() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/Animation - 1704780743146.json',
            width: 100),
      ),
    );
  }
}