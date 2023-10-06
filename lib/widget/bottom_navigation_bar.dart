import 'package:flutter/material.dart';
import 'package:rola_app/screens/search/search.dart';
import 'package:rola_app/styles/colors.dart';

import '../screens/bookings/bookings.dart';

class RolaBottomNavigationBar extends StatefulWidget {
  const RolaBottomNavigationBar({super.key});

  @override
  State<RolaBottomNavigationBar> createState() =>
      _RolaBottomNavigationBarState();
}

class _RolaBottomNavigationBarState extends State<RolaBottomNavigationBar> {
  var _currentIndex = 0;
  final List<Widget> _screens = [
    const SearchScreen(),
    const BookingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        _currentIndex = index;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => _screens.elementAt(index),
          ),
        );
      },
      elevation: 14,
      items: const [
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.stars_outlined),
          label: 'Bookings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment_ind_outlined),
          label: 'Profile',
        ),
      ],
      selectedItemColor: ColorSystem.teal,
    );
  }
}
