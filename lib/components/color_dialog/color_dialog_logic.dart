import 'dart:ui';

import 'package:get/get.dart';
import 'package:mood_diary/pages/home/setting/setting_logic.dart';
import 'package:mood_diary/utils/utils.dart';

import 'color_dialog_state.dart';

class ColorDialogLogic extends GetxController {
  final ColorDialogState state = ColorDialogState();

  late SettingLogic settingLogic = Bind.find<SettingLogic>();

  @override
  void onReady() {
    //如果支持系统颜色，获取系统颜色
    if (state.supportDynamic) {
      state.systemColor = Color(Utils().prefUtil.getValue<int>('systemColor')!);
      update();
    }
    super.onReady();
  }

  //更改主题色
  Future<void> changeSeedColor(index) async {
    await Utils().prefUtil.setValue<int>('color', index);
    state.currentColor = index;
    settingLogic.state.color = index;
    update();
    Get.changeTheme(Utils().themeUtil.buildTheme(Brightness.light));
    Get.changeTheme(Utils().themeUtil.buildTheme(Brightness.dark));
  }
}
