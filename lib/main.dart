import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wetherapp/sevices/location_provider.dart';
import 'package:wetherapp/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [ChangeNotifierProvider(create: (context) => locationprovider(),)],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme:
                  AppBarTheme(backgroundColor: Colors.transparent, elevation: 0)),
          title: 'Weather App',
          home: HomeScreen()),
    );
  }
}
