import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rola_app/models/bookings.dart';

import '../services/firebase_firestore.dart';

class BookingProvider extends StateNotifier<List<Booking>> {
  BookingProvider() : super([]);

  final FireStoreService _service = FireStoreService();
  Future<bool> book(Booking booking) async {
    bool isAlreadyAdded = state
        .where((element) => element.imagePath == booking.imagePath)
        .isNotEmpty;
    if (isAlreadyAdded) {
      state = state
          .where((element) => element.imagePath != booking.imagePath)
          .toList();
      return false;
    } else {
      state = [...state, booking];
      await _service.createBooking(booking);
      return true;
    }
  }

  Future<void> getBooking() async {
    final bookings = await _service.getBookings();
    state = [...bookings!.map((e) => Booking.fromJson(e))];
  }
}

final bookingProvider = StateNotifierProvider<BookingProvider, List<Booking>>(
  (ref) => BookingProvider(),
);
