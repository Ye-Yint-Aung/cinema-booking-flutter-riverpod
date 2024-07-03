import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:riverpod_demo/data/model/seat.dart';
import 'package:riverpod_demo/screens/booking/booking_confirm_screen.dart';

import '../../constant/constant.dart';
import '../../themes/styles.dart';

class ShowSeatWidget extends StatefulWidget {
  const ShowSeatWidget({
    super.key,
  });

  @override
  State<ShowSeatWidget> createState() => _ShowSeatWidgetState();
}

class _ShowSeatWidgetState extends State<ShowSeatWidget> {
  final _items = Constant.seats.map((animal) => MultiSelectItem<Seat>(animal, animal.name)).toList();

  late List<Object?> _selectedAnimals2 = [];

  @override
  Widget build(BuildContext context) {
    List<String> rollNumber = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"];
    List<String> seatNumber = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
    List<String> seats = [];
    List<String> selectedSeats = [];
    // bool isDisable = false;
    for (var i = 0; i < rollNumber.length; i++) {
      for (var j = 1; j < seatNumber.length + 1; j++) {
        seats.add("${rollNumber[i]}-$j");
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MultiSelectBottomSheetField(
            selectedItemsTextStyle: TextStyle(color: Colors.red),
            backgroundColor: Colors.black.withOpacity(0.3),
            decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey)),
            //initialChildSize: 0.5,
            listType: MultiSelectListType.CHIP,
            buttonIcon: Icon(Icons.apps_outlined),
            searchable: false,
            buttonText: Text(
              "CHOOSE SEATS",
              style: subTitle,
            ),
            title: const Text(""),
            confirmText: const Text(
              "OK",
              style: TextStyle(color: Colors.white),
            ),
            cancelText: const Text(
              "CANCEl",
              style: TextStyle(color: Colors.white),
            ),
            items: _items,
            onConfirm: (values) {
              setState(() {
                _selectedAnimals2 = values;
              });
            },
            chipDisplay: MultiSelectChipDisplay(
              chipWidth: 40,
              chipColor: Colors.green,
              //decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(width: 0.5, color: Colors.blue)),
              textStyle: const TextStyle(color: Colors.white, fontSize: 12),
              onTap: (value) {
                setState(() {
                  _selectedAnimals2.remove(value);
                });
              },
            ),
          ),
          _selectedAnimals2.isNotEmpty
              ? InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  onTap: () {
                    _showDialog(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    height: 50,
                    decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.blue), borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "CONTINUE",
                        style: subTitle,
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "None Selected yet",
                    style: title,
                  ),
                )
        ],
      ),
    );
    /*InkWell(
        onTap: () {
          showBottomSheet(
            backgroundColor: Colors.white.withOpacity(0.8),
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(0.0)),
            ),
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          child: const Text("CANCLE"),
                          onPressed: () {
                            selectedSeats = [];
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: const Text("DONE"),
                          onPressed: () {
                            Navigator.pop(context);
                            print("@@@@@@@@@@@@ :$selectedSeats");
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => BookingConfirmScreen()));
                            _showDialog(context);
                            */ /*showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return UserInfoDialog();
                              });*/ /*
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height - 20,
                        color: Colors.transparent,
                        child: GridView.builder(
                          itemCount: seats.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                selectedSeats.add(seats[index]);
                              },
                              child: Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(border: Border.all(width: 0.5), color: Colors.white),
                                  width: 10,
                                  height: 10,
                                  child: Column(
                                    children: [Text(seats[index]), const Text("4000")],
                                  )),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },


/////
        */ /*Container(
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            "SHOW SEATS",
            style: subTitle,
          ),
        ),
      ),*/ /*
        );*/
  }
}

_showDialog(context) {
  TextEditingController nameCtr = TextEditingController();
  TextEditingController phoneCtr = TextEditingController();
  return showDialog(
      barrierDismissible: false,
      barrierColor: Colors.blueGrey,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text("Confirm your information")),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Column(
              children: [
                TextField(
                  controller: nameCtr,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(hintText: "Name"),
                ),
                TextField(
                  controller: phoneCtr,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(hintText: "Phone Number"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                print("Name is : ${nameCtr.text} \n Phone is : ${phoneCtr.text}");
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => BookingConfirmScreen()));
              },
            ),
          ],
        );
      });
}
