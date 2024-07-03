import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:riverpod_demo/screens/booking/booking_screen.dart';
import 'package:riverpod_demo/themes/styles.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.imagePath});
  final String imagePath;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(widget.imagePath, fit: BoxFit.cover),
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(
                        color: Colors.grey.withOpacity(0.1),
                        alignment: Alignment.center,
                        child: Image.asset(
                          widget.imagePath,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      height: 70,
                      color: Colors.white.withOpacity(0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Top Gun",
                                style: subTitle,
                              ),
                              Text(
                                "2 hr 4 min, Action, Drama",
                                style: subTitle,
                              ),
                              Text(
                                "23, May, 2024 - 30, May, 2024",
                                style: subTitle,
                              ),
                            ],
                          ),
                          const CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Icon(Icons.play_arrow),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 15, left: 10, bottom: 0),
                child: Text(
                  "CINIMA LIST",
                  style: title,
                )),
            Container(
              padding: const EdgeInsets.all(5),
              // height: 400,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BookingScreen(),
                          ));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      height: 100,
                      decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.blueGrey), borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(color: Colors.transparent),
                            child: Image.asset(fit: BoxFit.cover, "assets/images/cinema.webp"),
                          ),
                          const VerticalDivider(
                            width: 0.5,
                            color: Colors.blueGrey,
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "NAYPYIDAW",
                                  style: title,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    "Cinema 1 (Ottatathiri)",
                                    style: subTitle,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      width: 100,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 1, color: Colors.green),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "BOOK NOW",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
