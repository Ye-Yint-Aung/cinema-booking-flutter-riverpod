import 'package:flutter/material.dart';
import 'package:riverpod_demo/widgets/ads_slideshow_widget.dart';
import 'package:riverpod_demo/widgets/marquee_text_widget.dart';
import 'package:riverpod_demo/widgets/now_showing_widget.dart';

import '../../widgets/upcomming_widget.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({super.key});

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AdsSlideShowWidget(),
            MarqueeTextWidget(),
            NowShowingWidget(),
            UpCommingWidget(),
          ],
        ),
      ),
    );
  }
}
