import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_demo/widgets/my_button.dart';


/* final otpProvider = StateNotifierProvider.autoDispose<OTPProvider, ApiState>((ref) {
  final repository = ref.watch(otpRepositoryProvider);
  return OTPProvider(repository);
}); */

class DrawerPage extends ConsumerWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final otpCode = ref.watch(otpProvider);
    //print("....................... : $otpCode");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer Page"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white70,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: MyButton(
          btnName: "BACK TO HOME",
          onTap: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
