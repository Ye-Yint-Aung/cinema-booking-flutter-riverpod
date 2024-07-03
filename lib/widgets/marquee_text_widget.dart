import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class MarqueeTextWidget extends StatelessWidget {
  const MarqueeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 30,
      width: double.infinity,
      decoration: BoxDecoration(color: Theme.of(context).secondaryHeaderColor),
      child: Marquee(
        text: 'Some sample text that takes some space.',
        style: const TextStyle(fontWeight: FontWeight.bold),
        scrollAxis: Axis.horizontal,
      ),
    );
  }
}
