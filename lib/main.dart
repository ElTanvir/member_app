import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/core/views/core_view.dart';
import 'package:member_app/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Member App',
        theme: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light().copyWith(
            primary: KEltColor.primary,
            secondary: KEltColor.background,
          ),
          scaffoldBackgroundColor: KEltColor.background,
        ),
        home: const CoreView(),
      ),
    );
  }
}
