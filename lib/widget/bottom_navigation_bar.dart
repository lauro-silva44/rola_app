import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rola_app/styles/colors.dart';

import '../config/routes/routes_location.dart';
import '../providers/bottom_navigation_provider.dart';

class RolaBottomNavigationBar extends ConsumerStatefulWidget {
  const RolaBottomNavigationBar({super.key});

  @override
  ConsumerState<RolaBottomNavigationBar> createState() =>
      _RolaBottomNavigationBarState();
}

class _RolaBottomNavigationBarState
    extends ConsumerState<RolaBottomNavigationBar> {
  final _screens = [
    AppRoutes.search,
    AppRoutes.bookings,
    AppRoutes.profile,
  ];
  @override
  Widget build(BuildContext context) {
    int currentIndex = ref.watch(bottomNavigatorProvider);
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        ref.read(bottomNavigatorProvider.notifier).changeCurrentIndex(index);
        context.push(_screens.elementAt(index));
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
