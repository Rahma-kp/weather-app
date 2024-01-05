import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wetherapp/sevices/location_provider.dart';
import 'package:wetherapp/sevices/weather_sevice_provider.dart';
import 'package:wetherapp/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => locationProvider(),
        ),
          ChangeNotifierProvider(
          create: (context) => weatherSeviceProvider(),)
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                  backgroundColor: Colors.transparent, elevation: 0)),
          title: 'Weather App',
          home: HomeScreen()),
    );
  }
}
