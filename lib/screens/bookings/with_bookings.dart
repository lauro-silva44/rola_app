import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rola_app/models/bookings.dart';

import '../../models/popular.dart';
import '../../styles/colors.dart';
import '../../widget/booking_card.dart';
import '../../widget/bottom_navigation_bar.dart';
import '../../widget/filed_button_list.dart';

class WithBookingScreen extends ConsumerStatefulWidget {
  const WithBookingScreen(this.bookings, {super.key});
  final List<Booking> bookings;

  @override
  ConsumerState<WithBookingScreen> createState() => _WithBookingScreenState();
}

class _WithBookingScreenState extends ConsumerState<WithBookingScreen> {
  bool _isListButtonTaped = false;
  bool _isCalenderButtonTaped = false;
  final _timeChips = [
    ['Ongoing', true],
    ['Upcoming', false],
    ['Completed', false],
  ];
  @override
  Widget build(BuildContext context) {
    var category = widget.bookings.first;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        leading: Center(
          child: Text(
            'Your Bookings',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w900, fontSize: 24),
          ),
        ),
        actions: [
          IconButton(
            style: _isListButtonTaped
                ? null
                : ButtonStyle(
                    shape: const MaterialStatePropertyAll(CircleBorder()),
                    backgroundColor:
                        MaterialStatePropertyAll(ColorSystem.black90),
                  ),
            onPressed: () {
              setState(() {
                _isListButtonTaped = !_isListButtonTaped;
                if (_isListButtonTaped) {
                  _isCalenderButtonTaped = false;
                }
              });
            },
            icon: Icon(
              Icons.sort,
              color: _isListButtonTaped ? ColorSystem.teal : null,
            ),
          ),
          IconButton(
            style: _isCalenderButtonTaped
                ? null
                : ButtonStyle(
                    shape: const MaterialStatePropertyAll(CircleBorder()),
                    backgroundColor:
                        MaterialStatePropertyAll(ColorSystem.black90),
                  ),
            onPressed: () {
              setState(() {
                _isCalenderButtonTaped = !_isCalenderButtonTaped;
                if (_isCalenderButtonTaped) {
                  _isListButtonTaped = false;
                }
              });
            },
            icon: Icon(
              Icons.calendar_today,
              color: _isCalenderButtonTaped ? ColorSystem.teal : null,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Column(
            children: [
              RolaFilledListButton(
                list: _timeChips,
              ),
              const SizedBox(
                height: 16,
              ),
              ...widget.bookings.map(
                (e) => BookingCard(
                  booking: e,
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const RolaBottomNavigationBar(),
    );
  }
}
