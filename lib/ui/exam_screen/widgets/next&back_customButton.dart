import 'package:flutter/material.dart';

class OutlinedFilledButton extends StatefulWidget {
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
  _OutlinedFilledButtonState createState() => _OutlinedFilledButtonState();
}

class _OutlinedFilledButtonState extends State<OutlinedFilledButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeOut,
        child: Transform.scale(
          scale: _isPressed ? 0.95 : 1.0, // تصغير الزر عند الضغط
          child: Container(
            width: 300,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: widget.borderSide
                  ? Colors.white
                  : Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
              border: widget.borderSide
                  ? Border.all(color: Theme.of(context).colorScheme.primary)
                  : Border.all(color: Colors.transparent),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary,
                  blurRadius: _isPressed ? 20 : 8,
                  offset: Offset(0, _isPressed ? 6 : 3),
                ),
              ],
            ),
            child: Text(
              widget.text,
              style: TextStyle(
                color: widget.borderSide
                    ? Theme.of(context).colorScheme.primary
                    : Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
