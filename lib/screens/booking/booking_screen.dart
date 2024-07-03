import 'package:flutter/material.dart';
import 'package:riverpod_demo/widgets/booking/booking_header_widget.dart';

import '../../widgets/booking/choose_date_widget.dart';
import '../../widgets/booking/show_seat_widget.dart';
import '../../widgets/booking/show_time_widget.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const BookingHeaderWidget(),
              const ChooseDateWidget(),
              const ShowTimeWidget(),
              const ShowSeatWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
