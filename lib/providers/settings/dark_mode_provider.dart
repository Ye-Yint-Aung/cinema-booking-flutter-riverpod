import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkModeNotifier extends StateNotifier<bool> {
  late SharedPreferences prefs;

  Future _init() async {
    prefs = await SharedPreferences.getInstance();
    var darkMode = prefs.getBool("darkMode");
    if(darkMode == true){
      state = true;
    }
    else{
      state = false;
    }
  }

  DarkModeNotifier() : super(false) {
    _init();
  }

  void changeTheme(ColorScheme theme) {
    state = !state;
    if(theme.brightness == Brightness.light){
      prefs.setBool("darkMode", false);
    }
    else{
      prefs.setBool("darkMode", true);
    }
  }
}

final darkModeProvider = StateNotifierProvider<DarkModeNotifier, bool>(
      (ref) => DarkModeNotifier(),
);