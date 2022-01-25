import 'package:flutter/material.dart';
import 'package:member_app/features/core/views/ctckupper.dart';
import 'package:member_app/utils/constants.dart';

class NeuButton extends StatelessWidget {
  final bool isChosen;
  final VoidCallback onPressed;
  final double buttonSize;
  final IconData icon;

  const NeuButton(
      {Key? key,
      required this.isChosen,
      required this.onPressed,
      required this.buttonSize,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: buttonSize,
      width: buttonSize,
      child: Listener(
        onPointerDown: (PointerDownEvent event) {
          onPressed();
        },
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 50),
              padding: EdgeInsets.all(width / 12),
              decoration: isChosen
                  ? KEltDecoration.innerShadow
                  : KEltDecoration.boxDecoration1,
            ),
            Align(
              child: Icon(
                icon,
                color: KEltColor.primary,
                size: buttonSize * 0.7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NeuSvgButton extends StatelessWidget {
  final bool isChosen;
  final VoidCallback onPressed;
  final double buttonSize;
  final Widget icon;

  const NeuSvgButton({
    required this.isChosen,
    required this.onPressed,
    required this.buttonSize,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: buttonSize,
      width: buttonSize,
      child: Listener(
        onPointerDown: (event) {
          onPressed();
        },
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 50),
              padding: EdgeInsets.all(width / 12),
              decoration: isChosen
                  ? KEltDecoration.innerShadow
                  : KEltDecoration.boxDecoration1,
            ),
            Align(
              child: icon,
            ),
          ],
        ),
      ),
    );
  }
}
