import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageButtonIndex extends StateNotifier<int> {
  HomePageButtonIndex() : super(0);
  // ignore: non_constant_identifier_names, avoid_setters_without_getters
  set StateValue(int value) {
    state = value;
  }
}

final homePageButtonIndexProvider =
    StateNotifierProvider<HomePageButtonIndex, int>(
  (ref) => HomePageButtonIndex(),
);
