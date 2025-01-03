import 'package:get/get.dart';

import 'wave_form_state.dart';

class WaveFormLogic extends GetxController {
  final WaveFormState state = WaveFormState();

  void maxLengthAdd(value, maxWidth) {
    if (state.amplitudes.length > maxWidth ~/ (state.barWidth + state.spaceWidth)) {
      state.amplitudes.removeAt(0);
    }
    state.amplitudes.add(value);
  }
}
