import 'package:flutter/material.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(color: Colors.white70),
          child: Column(
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blueAccent,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Ye Yint Aung"),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 5),
                height: 50,
                decoration: const BoxDecoration(color: Colors.white70),
                child: const Text("If you're going through hell, keep going."),
              ),
              Container(
                height: 180,
                decoration: const BoxDecoration(color: Colors.blueGrey),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text("FAVOURITE"), Text("COMMENT")],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
