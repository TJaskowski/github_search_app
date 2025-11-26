//External
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final ValueChanged<String>? onSubmitted;
  final Color? color;

  const CustomTextField({super.key, this.controller, this.hintText, this.onSubmitted, this.color});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        transform:
            isFocused ? Matrix4.translationValues(2, 5, 0) : Matrix4.identity(),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(25),
          
          boxShadow: isFocused
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

        child: TextField(
          focusNode: _focusNode,
          controller: widget.controller,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: const Icon(Icons.search),
            border: InputBorder.none, // ważne!
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          onSubmitted: widget.onSubmitted,
        ),
      
    );
  }
}