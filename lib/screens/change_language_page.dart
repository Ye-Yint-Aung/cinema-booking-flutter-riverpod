import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/providers/settings/language_provider.dart';

class ChangeLanguagePage extends ConsumerWidget {
  const ChangeLanguagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var language = ref.watch(languageProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Language Setting"),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: RadioListTile<Language>(
                    title: Text(tr("languageMM")),
                    value: Language.mm,
                    groupValue: language ? Language.en : Language.mm,
                    onChanged: (Language? value) {
                      ref.watch(languageProvider.notifier).changeLanguage(Language.mm);
                      context.setLocale(const Locale('my', 'MM'));
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<Language>(
                    title: Text(tr("languageEN")),
                    value: Language.en,
                    groupValue: language ? Language.en : Language.mm,
                    onChanged: (Language? value) {
                      ref.watch(languageProvider.notifier).changeLanguage(Language.en);
                      context.setLocale(const Locale('en', 'US'));
                    },
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
