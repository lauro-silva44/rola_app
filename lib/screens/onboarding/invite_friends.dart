import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rola_app/constants/measures.dart';
import 'package:rola_app/styles/images.dart';
import 'package:rola_app/widget/gradient_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InviteFriendsScreen extends StatelessWidget {
  const InviteFriendsScreen({super.key, required this.smoothPageIndicator});

  final SmoothPageIndicator smoothPageIndicator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(SvgAssets.rolaLogo),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: defaultHorizontalPadding),
            child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.clear),
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SvgPicture.asset(SvgAssets.inviteFriends),
            Text(
              'Invite Friends',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 100,
                  right: defaultHorizontalPadding,
                  left: defaultHorizontalPadding),
              child: Text(
                'Windows talking painted pasture yet its express parties use. Sure last upon he same as knew next. Of believed or diverted no rejoiced.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
            smoothPageIndicator,
            const SizedBox(
              height: 32,
            ),
            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: defaultHorizontalPadding),
              child: RolaGradientButton(label: 'Skip On-boarding'),
            )
          ],
        ),
      ),
    );
  }
}
