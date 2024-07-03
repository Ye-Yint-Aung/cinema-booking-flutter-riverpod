import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomTapChangeProvider extends StateNotifier<int> {
  Future _init() async {
    state = 0;
  }

  BottomTapChangeProvider() : super(0) {
    _init();
  }

  onTapChange(int tap) {
    state = tap;
  }
}

final bottomTapChangeProvider = StateNotifierProvider<BottomTapChangeProvider, int>(
  (ref) => BottomTapChangeProvider(),
);