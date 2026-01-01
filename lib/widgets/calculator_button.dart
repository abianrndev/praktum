import 'package:flutter/material.dart';

enum ButtonType { number, operation, equals, clear, function }

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;
  final bool isSelected;
  final double? flex;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.number,
    this.isSelected = false,
    this.flex,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex?.toInt() ?? 1,
      child: Container(
        margin: const EdgeInsets.all(4.0),
        height: 70,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: _getBackgroundColor(),
            foregroundColor: _getTextColor(),
            elevation: 2,
            shadowColor: Colors.black26,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: isSelected
                  ? const BorderSide(color: Colors.orange, width: 2)
                  : BorderSide.none,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: _getFontSize(),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    if (isSelected) return Colors.white;

    switch (type) {
      case ButtonType.number:
        return const Color(0xFF505050);
      case ButtonType.operation:
        return Colors.orange;
      case ButtonType.equals:
        return Colors.orange;
      case ButtonType.clear:
        return const Color(0xFFA6A6A6);
      case ButtonType.function:
        return const Color(0xFFA6A6A6);
    }
  }

  Color _getTextColor() {
    if (isSelected) return Colors.orange;

    switch (type) {
      case ButtonType.number:
        return Colors.white;
      case ButtonType.operation:
        return Colors.white;
      case ButtonType.equals:
        return Colors.white;
      case ButtonType.clear:
        return Colors.black;
      case ButtonType.function:
        return Colors.black;
    }
  }

  double _getFontSize() {
    if (text.length > 1) return 18;
    return 24;
  }
}
