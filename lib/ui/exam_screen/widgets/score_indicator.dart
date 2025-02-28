import 'package:flutter/material.dart';

class ScoreIndicator extends StatelessWidget {
  final String label;
  final int count;
  final bool isCorrect;

  const ScoreIndicator({
    super.key,
    required this.label,
    required this.count,
    required this.isCorrect,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color:
                isCorrect ? Theme.of(context).colorScheme.primary : Colors.red,
          ),
        ),
        Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: isCorrect
                    ? Theme.of(context).colorScheme.primary
                    : Colors.red,
                width: 2),
          ),
          child: Text(
            count.toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isCorrect
                  ? Theme.of(context).colorScheme.primary
                  : Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
