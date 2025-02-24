import 'package:flutter/material.dart';

class OutlinedFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool borderSide;
  const OutlinedFilledButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor:
              borderSide ? Colors.white : Theme.of(context).colorScheme.primary,
          foregroundColor:
              borderSide ? Theme.of(context).colorScheme.primary : Colors.white,
          fixedSize: const Size(300, 60),
          shape: RoundedRectangleBorder(
            side: borderSide
                ? BorderSide(color: Theme.of(context).colorScheme.primary)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          )),
      child: Text(text),
    );
  }
}
