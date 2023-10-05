import 'package:flutter/material.dart';

class RolaBottomNavigationBar extends StatelessWidget {
  const RolaBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
