import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  final Color? color;
  final Widget? title;
  final Widget? subtitle;
  final VoidCallback? onTap;

  const CustomListTile({super.key, this.color, this.title, this.subtitle, this.onTap});
  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  bool isPressed = false;
  void setPressed(bool value) {
    setState(() => isPressed = value);
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
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
          child: ListTile(
            title: widget.title,
            subtitle: widget.subtitle,
            onLongPress: () {
              setPressed(true);
              if (widget.onTap != null) {
                widget.onTap!();
              }
            },
            onTap: () {
              setPressed(true);
              Future.delayed(const Duration(milliseconds: 100), () {
                setPressed(false);
              });
              if (widget.onTap != null) {
                widget.onTap!();
              }
            },
          ),
        ),);
  }
}