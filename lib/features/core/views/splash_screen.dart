import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:member_app/utils/extensions.dart';
import 'package:member_app/utils/routes.dart';
import 'package:member_app/utils/string_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initFunction();
  }

  Future<void> initFunction() async {
    final Box box = await Hive.openBox(StringConstants.authBox);
    Future.delayed(
      const Duration(seconds: 2),
      () => (box.get(StringConstants.token) != '' &&
              box.get(StringConstants.token) != null)
          ? context.nav.pushNamed(Routes.home)
          : context.nav.pushNamed(Routes.login),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Hero(
          tag: 'eltanvir',
          child: Image.asset('assets/images/loader.png'),
        ),
      ),
    );
  }
}
