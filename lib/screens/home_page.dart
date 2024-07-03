import 'package:flutter/material.dart';
import 'package:riverpod_demo/screens/change_language_page.dart';
import 'package:riverpod_demo/screens/change_theme_page.dart';
import 'package:riverpod_demo/screens/drawer_page.dart';
import 'package:riverpod_demo/widgets/my_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: [
          MyButton(
            btnName: "THEMES",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChangeThemesPage()),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          MyButton(
            btnName: "LANGUAGES",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChangeLanguagePage()),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          MyButton(
            btnName: "DRAWER",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DrawerPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
