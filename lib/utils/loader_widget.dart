import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(50.0),
      child: RiveAnimation.asset('assets/rive/loader.riv'),
    );
  }
}
