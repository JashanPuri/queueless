import 'package:flutter/material.dart';
import 'scrollbehavior.dart';
import './auth/screens/otp-screen.dart';
import './auth/screens/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
      title: 'Queueless',
      theme: ThemeData(
        primaryColor: Color(0xFF2934D8),
      ),
      home: LoginScreen(),
      routes: {
        OtpScreen.routeName: (context) => OtpScreen()
      },
    );
  }
}
