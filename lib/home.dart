import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wetherapp/data/imagepath.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              alignment: Alignment(0.5, 0.5),
              child: Container(
                height: 100,
                child: Row(
                  children: [
                    Image.asset(
                      "assets/catogery/tem.png",
                      height: 100,
                    ),
                    Column(
                      children: [
                        Text("data"),
                         Text("dfghj")
                      ],
                    ),
                   
                  ],
                ),
              )),  Align(
              alignment: Alignment(0.40,0.40),
              child: Container(
                height: 100,
                child: Row(
                  children: [
                    Image.asset(
                      "assets/catogery/tem.png",
                      height: 100,
                    ),
                    Column(
                      children: [
                        Text("data"),
                         Text("dfghj")
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
