import 'package:flutter/material.dart';

class DisplayScreen extends StatelessWidget {
  final String display;
  final String operation;
  final String previousValue;

  const DisplayScreen({
    super.key,
    required this.display,
    this.operation = '',
    this.previousValue = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: const BoxDecoration(color: Colors.black),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Previous calculation
          if (operation.isNotEmpty && previousValue.isNotEmpty)
            Text(
              '$previousValue $operation',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          const SizedBox(height: 8),
          // Current display
          Text(
            display,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontWeight: FontWeight.w300,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
