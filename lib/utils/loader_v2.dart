import 'package:flutter/material.dart';

class LoaderV2 extends StatefulWidget {
  const LoaderV2({Key? key}) : super(key: key);

  @override
  _LoaderV2State createState() => _LoaderV2State();
}

class _LoaderV2State extends State<LoaderV2> with TickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    animationController.addListener(() {
      setState(() {});
    });
    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animationController.value,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Image.asset('assets/images/loader.png'),
      ),
    );
  }
}
