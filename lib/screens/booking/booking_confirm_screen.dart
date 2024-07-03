import 'package:flutter/material.dart';

class BookingConfirmScreen extends StatefulWidget {
  const BookingConfirmScreen({super.key});

  @override
  State<BookingConfirmScreen> createState() => _BookingConfirmScreenState();
}

class _BookingConfirmScreenState extends State<BookingConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Gun"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
            child: Column(
              children: [
                Text(
                  "Naypyitaw",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Ottarathiri Cinema 1",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: const Column(
              children: [
                VoucherLabel(label: "Booking Number : ", value: "0001"),
                VoucherLabel(label: "Cinema 1 : ", value: "A - 15, A - 16"),
                VoucherLabel(label: "Movie Name : ", value: "Top Gun"),
                VoucherLabel(label: "Customer Name : ", value: "Ye Yint Aung"),
                VoucherLabel(label: "Phone Number : ", value: "09946361106"),
                VoucherLabel(label: "Total Seat : ", value: "2"),
                VoucherLabel(label: "Total Amount : ", value: "28000 MMK"),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: 50,
              color: Colors.red,
              child: const Center(
                child: Text(
                  "Confirm",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white70),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class VoucherLabel extends StatelessWidget {
  const VoucherLabel({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label),
        Text(value),
      ]),
    );
  }
}
