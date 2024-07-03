import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/data/repositories/otp_repository.dart';
import 'package:riverpod_demo/domail/state/api_state.dart';
import 'package:riverpod_demo/providers/otp/otp_provider.dart';
import 'package:riverpod_demo/screens/botom_tap/business_tap.dart';
import 'package:riverpod_demo/screens/botom_tap/profile_tap.dart';
import 'package:riverpod_demo/screens/home_screen/home_nav.dart';

import '../../providers/bottom_tap_change_provider.dart';
import '../../providers/settings/dark_mode_provider.dart';
import '../../themes/color_schemes.dart';

final getOTPProvider = StateNotifierProvider<OTPProvider, ApiState>((ref) {
  final repository = ref.watch(otpRepositoryProvider);
  return OTPProvider(repository);
});

class MainHomeScreen extends ConsumerStatefulWidget {
  const MainHomeScreen({super.key});

  @override
  ConsumerState<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends ConsumerState<MainHomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomeNav(),
    BusinessTap(),
    ProfileTap(),
  ];

  void _onItemTapped(int index) {
    ref.read(bottomTapChangeProvider.notifier).onTapChange(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var darkMode = ref.watch(darkModeProvider);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("E 2 E"),
          centerTitle: true,
        ),
        drawer: Drawer(
          //backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text(
                  'Dark Mode',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  // Update the state of the app.
                },
                trailing: Transform.scale(
                  scale: 0.9,
                  child: Switch(
                    value: darkMode,
                    onChanged: (bool value1) {
                      print("Dark Mode is  : $darkMode and Value is $value1 ");
                      if (darkMode == value1) {
                        ref.watch(darkModeProvider.notifier).changeTheme(lightColorScheme);
                      } else {
                        ref.watch(darkModeProvider.notifier).changeTheme(darkColorScheme);
                      }
                    },
                  ),
                ),
              ),
              ListTile(
                title: const Text('Get OTP'),
                onTap: () {
                  // Update the state of the app.
                  final state = ref.read(getOTPProvider.notifier).fetchOTP();
                  print("OTP State is : $state");
                  if (state is SuccessState) {
                    print("CODE is Success : ${state}");
                  } else if (state is ErrorState) {
                    print("CODE is Error : ${state}");
                  } else {
                    print("CODE is Other : ${state}");
                  }
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
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Movies',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fastfood),
              label: 'Food & Drink',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
