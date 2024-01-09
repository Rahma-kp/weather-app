// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:wetherapp/sevices/location_provider.dart';
// import 'package:wetherapp/sevices/weather_sevice_provider.dart';

// class SearchProvider extends ChangeNotifier{
  
//   void refreshCurrentLocationWeather(BuildContext context) async {
//     final weatherProvider =
//         Provider.of<WeatherServiceProvider>(context, listen: false);
   

//     final locationProvider =
//         Provider.of<LocationProvider>(context, listen: false);
//     await locationProvider.determineposition();

//     if (locationProvider.currentLocationName != null) {
//       var city = locationProvider.currentLocationName!.locality;
//       if (city != null) {
//         weatherProvider.fetchWeatherDataByCity(city, context);
//       }
//     } else {
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text("Location Error"),
//           content: Text(
//               "Please ensure you have an internet connection and location services enabled."),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Close'),
//             ),
//           ],
//         ),
//       );
//     }
//     final snackBar = SnackBar(content: Text("Refreshed for current city."));
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
// }
