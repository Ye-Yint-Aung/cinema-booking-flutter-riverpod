import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
enum Language { mm, en }
class LanguageProvider extends StateNotifier<bool> {
  late SharedPreferences prefs;

  Future _init() async {
    prefs = await SharedPreferences.getInstance();
    var language = prefs.getBool("language");
    state = language ?? true;
  }

  LanguageProvider() : super(true) {
    _init();
  }

  void changeLanguage(Language language) {
    state = !state;
    if (language == Language.en) {
      prefs.setBool("language", true);
    } else {
      prefs.setBool("language", false);
    }
  }
}

final languageProvider = StateNotifierProvider<LanguageProvider, bool>(
  (ref) => LanguageProvider(),
);