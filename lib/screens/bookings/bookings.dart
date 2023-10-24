import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rola_app/providers/bookings.dart';
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
    var bookings = ref.watch(bookingProvider);
    if (bookings.isNotEmpty) {
      content = WithBookingScreen(bookings);
    }
    return content;
  }
}
