import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:rola_app/config/routes/routes_location.dart';
import 'package:rola_app/models/bookings.dart';
import 'package:rola_app/providers/favorites_provider.dart';
import 'package:rola_app/styles/images.dart';
import 'package:rola_app/widget/gradient_button.dart';
import 'package:rola_app/widget/rola_dropdown.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../models/popular.dart';
import '../../providers/bookings.dart';
import '../../styles/colors.dart';

class DetailsScreen extends ConsumerStatefulWidget {
  const DetailsScreen({
    super.key,
    required this.info,
    this.favoriteButtonOnPressed,
  });
  final Popular info;
  final void Function()? favoriteButtonOnPressed;

  @override
  ConsumerState<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {
  final _note = TextEditingController();
  var _choosedTime = '';
  final _timeChips = [
    ['03:00 PM', false],
    ['04:00 PM', false],
    ['06:00 PM', false],
    ['07:00 PM', false],
    ['09:00 PM', false],
    ['10:00 PM', false]
  ];

  String _finalPrice = '0';

  var _focusedDay = DateTime.now();

  showBookedDialog(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            TextButton(
              onPressed: () {
                context.push(AppRoutes.bookings);
              },
              child: Text(
                'ok',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: ColorSystem.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Lottie.asset(LottieAssets.booked)],
          ),
        );
      });
  @override
  void dispose() {
    super.dispose();
    _note.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isFavorite = ref.watch(favoriteProvider).contains(widget.info);

    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          leading: IconButton(
            style: ButtonStyle(
              shape: const MaterialStatePropertyAll(CircleBorder()),
              backgroundColor: MaterialStatePropertyAll(ColorSystem.black90),
            ),
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
              tag: widget.info.imagePath,
              child: Image.network(
                widget.info.imagePath,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          expandedHeight: 300,
          actions: [
            IconButton(
              style: ButtonStyle(
                shape: const MaterialStatePropertyAll(CircleBorder()),
                backgroundColor: MaterialStatePropertyAll(ColorSystem.black90),
              ),
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) => RotationTransition(
                  turns: Tween<double>(begin: 0.8, end: 1).animate(animation),
                  child: child,
                ),
                child: Icon(
                  Icons.favorite,
                  color: isFavorite ? Colors.redAccent : Colors.grey,
                  key: ValueKey(isFavorite),
                ),
              ),
              onPressed: () {
                ref.read(favoriteProvider.notifier).addPopular(widget.info);
              },
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              style: ButtonStyle(
                shape: const MaterialStatePropertyAll(CircleBorder()),
                backgroundColor: MaterialStatePropertyAll(ColorSystem.black90),
              ),
              icon: const Icon(
                Icons.share,
              ),
              onPressed: () {},
            ),
          ],
        ),
        SliverList.list(children: [
          Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 16, left: 16, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 80,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            widget.info.name,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: 36, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('\$'),
                            const Text(' • 3km away • 3 fields • 4.8 '),
                            SizedBox.square(
                              dimension: 10,
                              child: Icon(
                                Icons.star,
                                color: ColorSystem.teal,
                                size: 10,
                              ),
                            ),
                            const Text(' (6 reviews)'),
                          ],
                        ),
                        const Divider(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: RolaDropdown(
                            items: const [
                              'Public Court • \$0',
                              'Shared Court • \$15',
                              'Private Court • \$25'
                            ],
                            hint: 'choose your price',
                            addBorder: true,
                            onChanged: (price) {
                              RegExp regExp = RegExp(r'\d+');
                              Iterable<Match> matches =
                                  regExp.allMatches(price!);
                              List<String> numbers = matches
                                  .map((match) => match.group(0)!)
                                  .toList();
                              setState(() {
                                _finalPrice = numbers.first;
                              });
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: ColorSystem.black40, width: 1),
                              color: ColorSystem.black90),
                          child: TableCalendar(
                            startingDayOfWeek: StartingDayOfWeek.monday,
                            daysOfWeekStyle: DaysOfWeekStyle(
                              weekendStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: ColorSystem.black40,
                                      fontWeight: FontWeight.w600),
                              weekdayStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: ColorSystem.black40,
                                      fontWeight: FontWeight.w600),
                            ),
                            calendarStyle: CalendarStyle(
                                selectedDecoration: BoxDecoration(
                                    color: ColorSystem.teal,
                                    shape: BoxShape.circle),
                                todayTextStyle: TextStyle(
                                    color: ColorSystem.black90,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w800),
                                todayDecoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                outsideDaysVisible: false,
                                weekendTextStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: ColorSystem.black40),
                                defaultTextStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: ColorSystem.black40)),
                            headerStyle: const HeaderStyle(
                                formatButtonVisible: false,
                                titleCentered: true),
                            firstDay: DateTime.utc(2010, 10, 16),
                            lastDay: DateTime.utc(2030, 3, 14),
                            focusedDay: _focusedDay,
                            selectedDayPredicate: (day) {
                              return _focusedDay == day;
                            },
                            onDaySelected: (date1, date2) {
                              setState(() {
                                _focusedDay = date1;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                              color: ColorSystem.black90,
                              border: Border.all(color: ColorSystem.black40),
                              borderRadius: BorderRadius.circular(8)),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: _timeChips
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: FilledButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: e[1] as bool
                                            ? Colors.white
                                            : ColorSystem.black,
                                      ),
                                      child: Text(
                                        e[0] as String,
                                        style: TextStyle(
                                          color: e[1] as bool
                                              ? ColorSystem.black
                                              : Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          e[1] = !(e[1] as bool);
                                          _choosedTime = e[0] as String;
                                        });
                                      },
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          child: TextField(
                            controller: _note,
                            textAlignVertical: TextAlignVertical.top,
                            expands: true,
                            maxLines: null,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(8),
                              hintText: 'Add booking notes (optional)',
                              filled: true,
                              fillColor: ColorSystem.black90,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: ColorSystem.black40)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: ColorSystem.black40)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: ColorSystem.black40)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          widget.info.name,
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ])
      ]),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        height: 95,
        color: ColorSystem.black90,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_finalPrice == '0')
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\$$_finalPrice',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          TextSpan(
                            text: ' /entry',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'From ',
                              style: TextStyle(
                                color: Colors.grey.shade400,
                              )),
                          TextSpan(
                            text: '\$$_finalPrice',
                            style: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 18),
                          ),
                          TextSpan(
                            text: ' \$${(int.parse(_finalPrice) / 2).floor()}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          TextSpan(
                            text: ' /entry',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  Text(
                    'Limited time offer. 50% off',
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 10),
                  ),
                ],
              ),
            ),
            Expanded(
              child: RolaGradientButton(
                label: 'Reserve',
                onTap: () async {
                  var booking = Booking(
                      time: _choosedTime,
                      imagePath: widget.info.imagePath,
                      name: _note.text.isEmpty ? widget.info.name : _note.text,
                      entryPrice: (double.parse(_finalPrice) / 2),
                      sport: widget.info.sport,
                      distance: widget.info.distance,
                      rate: widget.info.rate,
                      isFavorite: isFavorite,
                      date: _focusedDay);
                  bool resp =
                      await ref.read(bookingProvider.notifier).book(booking);
                  if (resp && context.mounted) {
                    showBookedDialog(context);
                    await ref.read(bookingProvider.notifier).getBooking();
                  } else {
                    return;
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
