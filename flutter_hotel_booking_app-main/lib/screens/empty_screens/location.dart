import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking_app/initial_screen.dart';
import 'package:hotel_booking_app/screens/Home/HomeScreen.dart';
import 'package:hotel_booking_app/styles.dart';
// import 'package:gradient_app_bar/gradient_app_bar.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: const Color.fromRGBO(232, 244, 255, 1),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.location_on,
                        size: 80,
                        color: darkBlue,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Enable location",
                        style: TextStyle(color: Colors.black, fontSize: 28),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "You need to enable location to \nbrowse stays near you",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(94, 94, 94, 100),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            // padding: const EdgeInsets.all(5.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                  gradient: blueGradient(),
                  borderRadius: BorderRadius.all(Radius.circular(80.0))),
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: const Text(
                'ALLOW LOCATION',
                style: TextStyle(fontSize: 14, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => initialScreenPage()));
            },
            child: const Text(
              "Skip this step",
              style: TextStyle(color: Color.fromRGBO(94, 94, 94, 1)),
            ),
          )
        ],
      ),
    );
  }
}
