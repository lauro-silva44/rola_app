import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rola_app/models/bookings.dart';
import 'package:rola_app/styles/colors.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key, required this.info});
  final Booking info;

  @override
  Widget build(BuildContext context) {
    var bookingDate = DateFormat.yMd('en_US').format(info.date).toString();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          style: ButtonStyle(
            shape: const MaterialStatePropertyAll(CircleBorder()),
            backgroundColor: MaterialStatePropertyAll(ColorSystem.black90),
          ),
          icon: const Icon(Icons.clear),
          onPressed: () => context.pop(),
        ),
        centerTitle: true,
        title: Text(
          'Bookings Details',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.w900, fontSize: 18),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Edit',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: ColorSystem.teal,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    height: 192,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        info.imagePath,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Booking registered on $bookingDate ${info.time} • #9810941',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: ColorSystem.black40, fontSize: 10),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorSystem.black90,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SUMMARY',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Colors.grey.shade700,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(info.sport,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              color: Colors.grey.shade50,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14)),
                                ),
                                Text(
                                  info.sport,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Colors.grey.shade500,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                ),
                                Text(
                                  DateFormat('EEEE').format(info.date),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Colors.grey.shade500,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                ),
                              ],
                            ),
                            QrImageView(
                              data: info.name,
                              version: QrVersions.auto,
                              size: 88,
                              gapless: false,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorSystem.black90,
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ColorSystem.black),
                          child: Row(
                            children: [
                              Text(
                                '4.8',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 24, color: ColorSystem.blue),
                              ),
                              Icon(Icons.star, color: ColorSystem.blue),
                            ],
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: ColorSystem.black40),
                          onPressed: () {},
                          child: Text(
                            'Reviews',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: Colors.grey.shade100,
                                    fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
