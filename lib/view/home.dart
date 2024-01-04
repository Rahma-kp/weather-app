import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wetherapp/data/imagepath.dart';
import 'package:wetherapp/sevices/location_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    Provider.of<locationprovider>(context,listen: false).determineposition();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      // appBar: AppBar(),
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
          Container(
            height: 50,
            child: Row(children: [
              const Icon(
                Icons.location_pin,
                color: Colors.red,
                size: 35,
              ),
              const SizedBox(
                width: 10,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Malappuram",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Text("dfghjkl;", style: TextStyle(color: Colors.white))
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ))
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Align(
                alignment: Alignment.topCenter, child: Image.asset(weather[4])),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250, left: 130),
            child: Container(
              child: Column(
                children: [
                  const Text(
                    "21 c",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Rainy",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    DateFormat('yyyy-MM-dd').format(DateTime.now()),
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
          Align(
              alignment: const Alignment(0.7, 0.7),
              child: Container(
                height: 250,
                child: Column(
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
                            const Column(
                              children: [Text("data"), Text("dfghj")],
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
                              height: 100,
                            ),
                            const Column(
                              children: [Text("data"), Text("dfghj")],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.white,
                      height: 1,
                      thickness: 2,
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
                            const Column(
                              children: [Text("data"), Text("dfghj")],
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
                            const Column(
                              children: [Text("data"), Text("dfghj")],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ]),
      ),
    );
  }
}
