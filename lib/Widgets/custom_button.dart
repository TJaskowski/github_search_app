//External
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color? color;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.color,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isPressed = false;

  void setPressed(bool value) {
    setState(() => isPressed = value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setPressed(true),
      onTapUp: (_) => setPressed(false),
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        transform:
            isPressed ? Matrix4.translationValues(2, 5, 0) : Matrix4.identity(),
        decoration: BoxDecoration(
          color:  widget.color ,
          borderRadius: BorderRadius.circular(25),
          boxShadow:
              isPressed
                  ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.4),
                      offset: const Offset(-3, -3),
                      blurRadius: 5,
                    ),
                    BoxShadow(
                      color: Colors.white.withValues(alpha: 0.2),
                      offset: const Offset(3, 3),
                      blurRadius: 5,
                    ),
                  ]
                  : [
                    BoxShadow(
                      color: Colors.white.withValues(alpha: 0.2),
                      offset: const Offset(-3, -3),
                      blurRadius: 5,
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.4),
                      offset: const Offset(3, 3),
                      blurRadius: 5,
                    ),
                  ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: widget.child,
        ),
      ),
    );
  }
}
