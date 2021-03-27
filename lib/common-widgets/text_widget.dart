import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final text;
  final size;
  final color;
  final isBold;
  final maxLines;
  TextWidget(this.text,
      {double this.size = 16.0,
      this.isBold = false,
      this.color = Colors.black,
      this.maxLines = 2});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
      ),
    );
  }
}
