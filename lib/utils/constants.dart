import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KEltColor {
  KEltColor._();

  static const Color primary = Color(0xFF676FA3);
  static const Color background = Color(0xFFEEF2FF);
  static const Color card = Color(0xFFCDDEFF);
  static const Color highLight = Color(0xFFFF5959);
  static const Color black = Color(0xFF191919);
}

class KEltString {
  KEltString._();
  static String baseImageurl = 'http://erp.superhostelbd.com/super_home/';
}

class KEltDecoration {
  KEltDecoration._();
  static BoxDecoration boxDecoration1 = BoxDecoration(
    color: KEltColor.background.withOpacity(0.8),
    borderRadius: BorderRadius.circular(30),
    boxShadow: [
      BoxShadow(
        offset: const Offset(-5, -5),
        blurRadius: 6.0,
        spreadRadius: 3.0,
        color: KEltColor.background.withOpacity(0.7),
      ),
      BoxShadow(
        offset: const Offset(5, 5),
        blurRadius: 6.0,
        spreadRadius: 3.0,
        color: KEltColor.primary.withOpacity(0.2),
      ),
    ],
  );

  static BoxDecoration boxDecoration2 = BoxDecoration(
    color: KEltColor.background.withOpacity(0.8),
    borderRadius: BorderRadius.circular(30),
    boxShadow: [
      BoxShadow(
        offset: const Offset(5, 5),
        blurRadius: 6.0,
        spreadRadius: -3.0,
        color: KEltColor.background.withOpacity(0.7),
      ),
      BoxShadow(
        offset: const Offset(-5, -5),
        blurRadius: 6.0,
        spreadRadius: -3.0,
        color: KEltColor.primary.withOpacity(0.2),
      ),
    ],
  );
}

class KEltTextStyle {
  KEltTextStyle._();

  static TextStyle subtitleText = const TextStyle(color: KEltColor.primary);
  static TextStyle titleText =
      const TextStyle(color: KEltColor.primary, fontWeight: FontWeight.bold);
}

int getDaysinAmonth({required int year, required int month}) {
  final DateTime x1 = DateTime(year, month, 0).toUtc();
  return DateTime(
    (month == 12) ? year + 1 : year,
    (month == 12) ? 1 : month + 1,
    0,
  ).toUtc().difference(x1).inDays;
}