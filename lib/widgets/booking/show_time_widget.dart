import 'package:flutter/material.dart';

import '../../themes/styles.dart';

class ShowTimeWidget extends StatelessWidget {
  const ShowTimeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey)),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            "SHOWTIME",
            style: subTitle,
          ),
        ),
        Container(
          //decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(width: 1, color: Colors.blue)),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          padding: const EdgeInsets.all(5),
          height: 80,
          child: GridView.builder(
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 0.0,
              childAspectRatio: 2,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    //color: Colors.white,
                    border: Border.all(width: 0.5, color: Colors.blue),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: Text("1:00 PM")),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
