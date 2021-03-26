import 'package:flutter/material.dart';

class LoginImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Image.asset(
        'assets/images/login-theme.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
