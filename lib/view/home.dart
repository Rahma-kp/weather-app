import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wetherapp/data/imagepath.dart';
import 'package:wetherapp/sevices/location_provider.dart';
import 'package:wetherapp/sevices/weather_sevice_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final locationpro = Provider.of<LocationProvider>(context, listen: false);
    locationpro.determineposition().then((_) {
      if (locationpro.currentLocationName != null) {
        var city = locationpro.currentLocationName!.locality;
        if (city != null) {
          Provider.of<WeatherServiceProvider>(context, listen: false)
              .fetchWeatherDataByCity(city, context);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgimage[0]),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: [
          Positioned(
              top: 60,
              right: 20,
              left: 20,
              child: Container(
                child: Consumer<WeatherServiceProvider>(
                  builder: (context, value, child) => TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: value.searchController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              value.fetchWeatherDataByCity(value.searchController.text.trim(), context);
                              value.searchController.clear();
                            },
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                        hintText: "Search City",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      )),
                ),
                height: 40,
              )),
          Consumer<LocationProvider>(
            builder: (context, providerval, child) => Container(
              height: 50,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Colors.red,
                          size: 35,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          providerval.currentLocationName?.locality ??
                              'unkown location',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset("assets/wether/1.1-removebg-preview.png")),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250, left: 130),
            child: Container(
              child: Column(
                children: [
                  Consumer<WeatherServiceProvider>(
                    builder: (context, value, child) => Text(
                      '${value.weather?.main?.feelsLike ?? 'N/A '}\u00b0c',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Consumer<WeatherServiceProvider>(
                    builder: (context, value, child) => Text(
                      '${value.weather?.clouds ?? 'N/A '}\u00b0c',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Text(
                    DateFormat('dd-MM-yyyy').format(DateTime.now()),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.5),
              ),
              height: 200,
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/catogery/tem.png",
                            height: 100,
                          ),
                          Column(
                            children: [
                              const Text(
                                "Temp Max",
                                style: TextStyle(color: Colors.white),
                              ),
                              Consumer<WeatherServiceProvider>(
                                builder: (context, value, child) => Text(
                                  '${value.weather?.main?.tempMax ?? 'N/A '}\u00b0c',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/catogery/cool.png",
                            height: 80,
                          ),
                          Column(
                            children: [
                              const Text(
                                "Temp Min",
                                style: TextStyle(color: Colors.white),
                              ),
                              Consumer<WeatherServiceProvider>(
                                builder: (context, value, child) => Text(
                                  '${value.weather?.main?.tempMin ?? 'N/A '}\u00b0c',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/catogery/sun.png",
                            height: 50,
                          ),
                          Column(
                            children: [
                              Text(
                                "Sun Rise",
                                style: TextStyle(color: Colors.white),
                              ),
                              Consumer<WeatherServiceProvider>(
                                builder: (context, value, child) => Text(
                                  value.weather != null
                                      ? DateFormat('hh:mm').format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              value.weather!.sys!.sunrise! *
                                                  1000))
                                      : 'N/A',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 35,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/catogery/moon2.png",
                            height: 70,
                          ),
                          Column(
                            children: [
                              Text(
                                "Sun Set",
                                style: TextStyle(color: Colors.white),
                              ),
                              Consumer<WeatherServiceProvider>(
                                builder: (context, value, child) => Text(
                                  value.weather != null
                                      ? DateFormat('hh:mm').format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              value.weather!.sys!.sunrise! *
                                                  1000))
                                      : 'N/A',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void searchCity(BuildContext context) {
    final weatherProvider =
        Provider.of<WeatherServiceProvider>(context, listen: false);
    weatherProvider.fetchWeatherDataByCity(
        weatherProvider.searchController.text.trim(), context);
    weatherProvider.searchController.clear();
  }

  void refreshCurrentLocationWeather(BuildContext context) async {
    final weatherProvider =
        Provider.of<WeatherServiceProvider>(context, listen: false);

    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    await locationProvider.determineposition();

    if (locationProvider.currentLocationName != null) {
      var city = locationProvider.currentLocationName!.locality;
      if (city != null) {
        weatherProvider.fetchWeatherDataByCity(city, context);
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Location Error"),
          content: Text(
              "Please ensure you have an internet connection and location services enabled."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        ),
      );
    }
    final snackBar = SnackBar(content: Text("Refreshed for current city."));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
