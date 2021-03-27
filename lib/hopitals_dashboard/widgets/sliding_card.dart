import 'package:flutter/material.dart';

class SlidingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            width: 60,
            height: 7,
            decoration: BoxDecoration(
                color: Color(0xFFC4C4C4),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}