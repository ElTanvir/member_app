import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaginationOpenNotifier extends ChangeNotifier {
  bool _isOpen = false;
  bool get isOpen => _isOpen;
  void switchOpen() {
    _isOpen = !_isOpen;
    notifyListeners();
  }
}

class PaginationIndexNotfier extends StateNotifier<int> {
  PaginationIndexNotfier() : super(1);
  set statevalue(int value) {
    state = value;
  }

  int get statevalue => state;
}

class PaginationMaxCountNotfier extends StateNotifier<int> {
  PaginationMaxCountNotfier() : super(1);
  set statevalue(int value) {
    state = value;
  }

  int get statevalue => state;
}
