import 'package:flutter/widgets.dart';

/// `Navigator.of(context)` as `context.nav`
extension TinyContextNavigator on BuildContext {
  NavigatorState get nav {
    return Navigator.of(this);
  }
}
