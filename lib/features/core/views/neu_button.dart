import 'package:flutter/material.dart';
import 'package:member_app/features/core/views/ctckupper.dart';
import 'package:member_app/utils/constants.dart';

class NeuButton extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  NeuButton({
    Key? key,
    required this.onPressed,
    this.isChosen = false,
    required this.buttonSize,
    required this.icon,
  }) : super(key: key);

  final bool isChosen;
  final VoidCallback onPressed;
  final double buttonSize;
  final IconData icon;

  @override
  _NeuButtonState createState() => _NeuButtonState();
}

class _NeuButtonState extends State<NeuButton> {
  bool _isPressed = false;

  @override
  void didUpdateWidget(NeuButton oldWidget) {
    if (oldWidget.isChosen != widget.isChosen) {
      setState(() => _isPressed = widget.isChosen);
    }
    super.didUpdateWidget(oldWidget);
  }

  void _onPointerDown(PointerDownEvent event) {
    setState(() => _isPressed = true);
    widget.onPressed();
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() => _isPressed = widget.isChosen);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final buttonWidth = widget.buttonSize;
    final squareSideLength = buttonWidth;
    final buttonSize = Size(buttonWidth, squareSideLength);

    final innerShadow = ConcaveDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      depression: 5,
    );

    final outerShadow = KEltDecoration.boxDecoration1;

    return SizedBox(
      height: buttonSize.height,
      width: buttonSize.width,
      child: Listener(
        onPointerDown: _onPointerDown,
        onPointerUp: _onPointerUp,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 50),
              padding: EdgeInsets.all(width / 12),
              decoration: _isPressed ? innerShadow : outerShadow,
            ),
            Align(
              child: Icon(
                widget.icon,
                color: KEltColor.primary,
                size: buttonWidth * 0.7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NeuSvgButton extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  NeuSvgButton({
    Key? key,
    required this.onPressed,
    this.isChosen = false,
    required this.buttonSize,
    required this.icon,
  }) : super(key: key);

  final bool isChosen;
  final VoidCallback onPressed;
  final double buttonSize;
  final Widget icon;

  @override
  _NeuSvgButtonState createState() => _NeuSvgButtonState();
}

class _NeuSvgButtonState extends State<NeuSvgButton> {
  bool _isPressed = false;

  @override
  void didUpdateWidget(NeuSvgButton oldWidget) {
    if (oldWidget.isChosen != widget.isChosen) {
      setState(() => _isPressed = widget.isChosen);
    }
    super.didUpdateWidget(oldWidget);
  }

  void _onPointerDown(PointerDownEvent event) {
    setState(() => _isPressed = true);
    widget.onPressed();
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() => _isPressed = widget.isChosen);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final buttonWidth = widget.buttonSize;
    final squareSideLength = buttonWidth;
    final buttonSize = Size(buttonWidth, squareSideLength);

    final innerShadow = ConcaveDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      depression: 5,
    );

    final outerShadow = KEltDecoration.boxDecoration1;

    return SizedBox(
      height: buttonSize.height,
      width: buttonSize.width,
      child: Listener(
        onPointerDown: _onPointerDown,
        onPointerUp: _onPointerUp,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 50),
              padding: EdgeInsets.all(width / 12),
              decoration: _isPressed ? innerShadow : outerShadow,
            ),
            Align(
              child: widget.icon,
            ),
          ],
        ),
      ),
    );
  }
}
