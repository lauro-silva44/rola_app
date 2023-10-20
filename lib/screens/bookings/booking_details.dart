import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rola_app/styles/colors.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String backgroundImagePath =
        'https://images.unsplash.com/photo-1500462918059-b1a0cb512f1d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MTE5MTJ8MHwxfHNlYXJjaHwxfHxnYW1pbmctY2hhbXBpb25zaGlwLW5lb258ZW58MHx8fHwxNjk3ODAzMDk4fDA&ixlib=rb-4.0.3&q=80&w=400';
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
            Container(
              margin: const EdgeInsets.only(top: 16),
              height: 192,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  backgroundImagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
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
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text('Dance Dance Studio',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Colors.grey.shade50,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14)),
                          ),
                          Text(
                            'Dance class for 2',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                          ),
                          Text(
                            'Wednesday',
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
                        data: 'This is a simple QR code',
                        version: QrVersions.auto,
                        size: 88,
                        gapless: false,
                      )
                    ],
                  )
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
