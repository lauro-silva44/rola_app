import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rola_app/providers/favorites_provider.dart';
import 'package:rola_app/screens/bookings/empty_list.dart';
import 'package:rola_app/screens/bookings/with_bookings.dart';

class BookingsScreen extends ConsumerStatefulWidget {
  const BookingsScreen({super.key});

  @override
  ConsumerState<BookingsScreen> createState() => _State();
}

class _State extends ConsumerState<BookingsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const EmptyBookingScreen();
    var favorites = ref.watch(favoriteProvider);
    if (favorites.isNotEmpty) {
      content = WithBookingScreen(favorites);
    }
    return content;
  }
}
