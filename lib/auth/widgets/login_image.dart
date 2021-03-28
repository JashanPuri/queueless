import 'package:flutter/material.dart';
import 'package:queueless/doctor_dashboard/doctor_dashboard.dart';

class LoginImage extends StatelessWidget {
  final bool isLoginScreen;

  const LoginImage({Key key, this.isLoginScreen = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoginScreen
          ? () => Navigator.of(context)
              .pushReplacementNamed(DoctorDashboard.routeName)
          : null,
      child: Container(
        height: 300,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 30),
        child: Image.asset(
          'assets/images/login-theme.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
