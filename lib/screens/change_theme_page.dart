import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/providers/settings/dark_mode_provider.dart';
import 'package:riverpod_demo/themes/color_schemes.dart';

class ChangeThemesPage extends ConsumerWidget {
  const ChangeThemesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkMode = ref.watch(darkModeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Themes Setting"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 15),
            child: Text(
              tr("theme"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: RadioListTile<ColorScheme>(
                  title: Text(tr("light")),
                  value: lightColorScheme,
                  groupValue: darkMode ? darkColorScheme : lightColorScheme,
                  onChanged: (ColorScheme? value) {
                    ref.watch(darkModeProvider.notifier).changeTheme(lightColorScheme);
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<ColorScheme>(
                  title: Text(
                    tr("dark"),
                    style: TextStyle(
                      color: darkMode ? const Color(0xffD9D9D9) : const Color(0xff1C201E),
                    ),
                  ),
                  value: darkColorScheme,
                  groupValue: darkMode ? darkColorScheme : lightColorScheme,
                  onChanged: (ColorScheme? value) {
                    ref.watch(darkModeProvider.notifier).changeTheme(darkColorScheme);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
