import 'package:flutter/material.dart';

import '../../themes/styles.dart';

class ChooseDateWidget extends StatelessWidget {
  const ChooseDateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 230,
      //color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            //color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 8),

            width: double.infinity,
            decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey)),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              "CHOOSE DATE",
              style: subTitle,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(5),
            height: 180,
            child: GridView.builder(
              itemCount: 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.blue),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(child: Text("23")),
                      Center(child: Text("SUN")),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
