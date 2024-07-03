import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.btnName, this.onTap});
  final String btnName;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 100),
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
            //color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: Colors.blueAccent)),
        child: Center(
            child: Text(
          btnName,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.grey),
        )),
      ),
    );
  }
}
