import 'package:flutter/material.dart';
import 'package:hotel_booking_app/elements/SearchScreenResult.dart';
import 'package:hotel_booking_app/initial_screen.dart';
import 'package:hotel_booking_app/screens/Bookings/BookingHistory.dart';
import 'package:hotel_booking_app/screens/Bookings/ReviewBooking.dart';
import 'package:hotel_booking_app/screens/OTP/Add_no1.dart';
import 'package:hotel_booking_app/screens/empty_screens/PropertyType.dart';
import 'package:hotel_booking_app/screens/empty_screens/Splash_screen.dart';
import 'package:hotel_booking_app/screens/empty_screens/Wishlist_full.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: SplashScreen(),
      // home: initialScreenPage(),
    );
  }
}
