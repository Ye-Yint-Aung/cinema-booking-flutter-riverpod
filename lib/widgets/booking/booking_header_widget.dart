import 'package:flutter/material.dart';

import '../../themes/styles.dart';

class BookingHeaderWidget extends StatelessWidget {
  const BookingHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      //color: Theme.of(context).,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/TopGun.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Naypyidaw,Ottarathiri", style: subTitle),
                Text("Top Gun", style: subTitle),
                Text("Cinema 1", style: subTitle),
                Text("2 hr 40 min", style: subTitle),
                Text("Action, Drama", style: subTitle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
