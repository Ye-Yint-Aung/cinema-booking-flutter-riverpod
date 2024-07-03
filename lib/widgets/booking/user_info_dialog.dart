import 'package:flutter/material.dart';

class UserInfoDialog extends StatelessWidget {
  const UserInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameCtr = TextEditingController();
    TextEditingController phoneCtr = TextEditingController();
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
              decoration: const InputDecoration(hintText: "Name"),
            ),
            TextField(
              controller: phoneCtr,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(hintText: "Phone Number"),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('CANCEL'),
          onPressed: () {
            print("Name is : ${nameCtr.text} \n Phone is : ${phoneCtr.text}");
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            print("Name is : ${nameCtr.text} \n Phone is : ${phoneCtr.text}");
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
