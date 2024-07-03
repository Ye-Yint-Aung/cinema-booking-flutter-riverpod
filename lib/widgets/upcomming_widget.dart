import 'package:flutter/material.dart';
import 'package:riverpod_demo/themes/styles.dart';

import '../screens/detail/detail.dart';

class UpCommingWidget extends StatelessWidget {
  const UpCommingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 20,
            child: const Text(
              "UPCOMMING",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.65,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailScreen(
                            imagePath: "assets/images/TopGun.jpg",
                          ),
                        )),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white70),
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/TopGun.jpg",
                            fit: BoxFit.cover,
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            height: 50,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "2024",
                                  style: subTitle,
                                ),
                                Text(
                                  "Action,Drama,Sci-Fi",
                                  style: subTitle,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
