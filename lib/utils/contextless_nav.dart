import 'package:flutter/cupertino.dart';

class ContextLess {
  ContextLess._();
  static final GlobalKey<NavigatorState> navigatorkey =
      GlobalKey<NavigatorState>();

  static NavigatorState get nav {
    return Navigator.of(navigatorkey.currentContext!);
  }
}
