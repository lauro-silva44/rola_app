import 'package:flutter/material.dart';
import 'package:rola_app/widget/gradient_button.dart';
import 'package:rola_app/widget/rola_dropdown.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../styles/colors.dart';
import '../../styles/images.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: AppBar(
                leading: IconButton(
                  style: ButtonStyle(
                    shape: const MaterialStatePropertyAll(CircleBorder()),
                    backgroundColor:
                        MaterialStatePropertyAll(ColorSystem.black90),
                  ),
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                flexibleSpace: Image.asset(
                  PngAssets.snowboarding,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(300),
                  child: SizedBox(),
                ),
                actions: [
                  IconButton(
                    style: ButtonStyle(
                      shape: const MaterialStatePropertyAll(CircleBorder()),
                      backgroundColor:
                          MaterialStatePropertyAll(ColorSystem.black90),
                    ),
                    icon: const Icon(
                      Icons.favorite,
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    style: ButtonStyle(
                      shape: const MaterialStatePropertyAll(CircleBorder()),
                      backgroundColor:
                          MaterialStatePropertyAll(ColorSystem.black90),
                    ),
                    icon: const Icon(
                      Icons.share,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 16, left: 16, bottom: 16),
                  child: Column(
                    children: [
                      const Text(
                        ('Vr'),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: RolaDropdown(
                          items: ['', 'd'],
                          hint: 'Private Court • \$25',
                          addBorder: true,
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
                              todayTextStyle: TextStyle(
                                  color: ColorSystem.black90,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w800),
                              todayDecoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
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
                              formatButtonVisible: false, titleCentered: true),
                          firstDay: DateTime.utc(2010, 10, 16),
                          lastDay: DateTime.utc(2030, 3, 14),
                          focusedDay: DateTime.now(),
                        ),
                      ),
                      SizedBox(
                        height: 500,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 95,
        color: ColorSystem.black90,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('dfadsf'),
                Text('adfadsf'),
              ],
            ),
            Expanded(child: RolaGradientButton(label: 'Reserve'))
          ],
        ),
      ),
    );
  }
}
