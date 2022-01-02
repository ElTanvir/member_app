import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:member_app/utils/constants.dart';

class ConcaveDecoration extends Decoration {
  final ShapeBorder shape;
  final double depression;
  final List<Color>? colors;

  // ignore: prefer_const_constructors_in_immutables
  ConcaveDecoration({
    required this.shape,
    required this.depression,
    this.colors,
    // ignore: unnecessary_null_comparison
  })  : assert(shape != null),
        assert(depression >= 0),
        assert(colors == null || colors.length == 2);

  @override
  BoxPainter createBoxPainter([Function()? onChanged]) =>
      _ConcaveDecorationPainter(
        shape,
        depression,
        colors ??
            [
              KEltColor.black,
              Colors.white,
            ],
      );

  @override
  EdgeInsetsGeometry get padding => shape.dimensions;
}

class _ConcaveDecorationPainter extends BoxPainter {
  ShapeBorder shape;
  double depression;
  List<Color>? colors;

  _ConcaveDecorationPainter(this.shape, this.depression, this.colors) {
    colors ??= [
      KEltColor.black,
      Colors.white,
    ];
  }

  @override
  void paint(
    ui.Canvas canvas,
    ui.Offset offset,
    ImageConfiguration configuration,
  ) {
    final rect = offset & configuration.size!;
    final shapePath = shape.getOuterPath(rect);

    final delta = 16 / rect.longestSide;
    final stops = [0.5 - delta, 0.5 + delta];

    final path = Path()
      ..fillType = PathFillType.evenOdd
      ..addRect(rect.inflate(depression * 2))
      ..addPath(shapePath, Offset.zero);
    canvas.save();
    canvas.clipPath(shapePath);

    final paint = Paint()
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, depression);
    final clipSize = rect.size.aspectRatio > 1
        ? Size(rect.width, rect.height / 2)
        : Size(rect.width / 2, rect.height);
    for (final alignment in [Alignment.topLeft, Alignment.bottomRight]) {
      final shaderRect =
          alignment.inscribe(Size.square(rect.longestSide), rect);
      // ignore: avoid_single_cascade_in_expression_statements
      paint
        ..shader = ui.Gradient.linear(
          shaderRect.topLeft,
          shaderRect.bottomRight,
          colors!,
          stops,
        );

      canvas.save();
      canvas.clipRect(alignment.inscribe(clipSize, rect));
      canvas.drawPath(path, paint);
      canvas.restore();
    }
    canvas.restore();
  }
}
