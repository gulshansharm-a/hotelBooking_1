import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking_app/screens/Bookings/BookingHistory.dart';
import 'package:hotel_booking_app/screens/Bookings/HOtelMaps.dart';
import 'package:hotel_booking_app/screens/Home/HomeScreen.dart';
import 'package:hotel_booking_app/screens/Bookings/ReviewBooking2.dart';
import 'package:hotel_booking_app/screens/Hosting/Hosting.dart';
import 'package:hotel_booking_app/screens/empty_screens/Wishlist_empty.dart';
import 'package:hotel_booking_app/screens/Notifications/Notifications.dart';
import 'package:hotel_booking_app/styles.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class initialScreenPage extends StatefulWidget {
  initialScreenPage({Key? key}) : super(key: key);

  @override
  State<initialScreenPage> createState() => _initialScreenPageState();
}

class _initialScreenPageState extends State<initialScreenPage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    homeScreenPage(),
    // bookingsPage(),
    BookHistory(),
    notificationsPage(),
    hostingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              size: 25,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_added_rounded,
            ),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_rounded,
            ),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.swap_calls_rounded,
            ),
            label: 'Hosting',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: darkBlue,
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
