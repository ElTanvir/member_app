import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:member_app/features/core/views/splash_screen.dart';

import 'package:member_app/utils/constants.dart';
import 'package:member_app/utils/contextless_nav.dart';
import 'package:member_app/utils/routes.dart';
import 'package:member_app/utils/string_constants.dart';

final appIsLiveProvider = Provider<bool>(
  //TRUE = Live  false = Dummy Data
  (ref) => true,
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(StringConstants.authBox);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Member App',
      theme: ThemeData.light().copyWith(
        colorScheme: const ColorScheme.light().copyWith(
          primary: KEltColor.primary,
          secondary: KEltColor.background,
        ),
        scaffoldBackgroundColor: KEltColor.background,
      ),
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
      navigatorKey: ContextLess.navigatorkey,
      home: const SplashScreen(),
      onGenerateRoute: (settings) => generatedRoutes(settings),
    );
  }
}
