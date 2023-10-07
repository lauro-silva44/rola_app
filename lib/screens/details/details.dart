import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../styles/colors.dart';
import '../../styles/images.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  double _imageSizeHeight = 0.0;
  Image image = Image.asset(PngAssets.snowboarding);

  @override
  void initState() {
    super.initState();
    generateImageHeight();
  }

  void generateImageHeight() {
    ImageStreamListener(
      (ImageInfo info, bool _) {
        setState(() {
          // Update the dimensions once the image is loaded.
          _imageSizeHeight = info.image.height.toDouble();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              backgroundColor: MaterialStatePropertyAll(ColorSystem.black90),
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
              backgroundColor: MaterialStatePropertyAll(ColorSystem.black90),
            ),
            icon: const Icon(
              Icons.share,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                ('Vr'),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: ColorSystem.black, width: 2),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
