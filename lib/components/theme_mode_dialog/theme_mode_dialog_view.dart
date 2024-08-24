import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import 'theme_mode_dialog_logic.dart';

class ThemeModeDialogComponent extends StatelessWidget {
  const ThemeModeDialogComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(ThemeModeDialogLogic());
    final state = Bind.find<ThemeModeDialogLogic>().state;
    final i18n = AppLocalizations.of(context)!;

    return GetBuilder<ThemeModeDialogLogic>(
      init: logic,
      assignId: true,
      builder: (logic) {
        return SimpleDialog(
          title: Text(i18n.settingThemeMode),
          children: [
            SimpleDialogOption(
              child: Row(
                children: [
                  if (state.themeMode == 0) ...[
                    const Icon(Icons.check),
                  ] else ...[
                    const Icon(Icons.brightness_auto_outlined),
                  ],
                  const SizedBox(
                    width: 10,
                  ),
                  Text(i18n.themeModeSystem),
                ],
              ),
              onPressed: () {
                logic.changeThemeMode(0);
              },
            ),
            SimpleDialogOption(
              child: Row(
                children: [
                  if (state.themeMode == 1) ...[
                    const Icon(Icons.check),
                  ] else ...[
                    const Icon(Icons.light_mode_outlined),
                  ],
                  const SizedBox(
                    width: 10,
                  ),
                  Text(i18n.themeModeLight),
                ],
              ),
              onPressed: () {
                logic.changeThemeMode(1);
              },
            ),
            SimpleDialogOption(
              child: Row(
                children: [
                  if (state.themeMode == 2) ...[
                    const Icon(Icons.check),
                  ] else ...[
                    const Icon(Icons.dark_mode_outlined),
                  ],
                  const SizedBox(
                    width: 10,
                  ),
                  Text(i18n.themeModeDark),
                ],
              ),
              onPressed: () {
                logic.changeThemeMode(2);
              },
            ),
          ],
        );
      },
    );
  }
}
