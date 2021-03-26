import 'package:flutter/material.dart';
import '../widgets/login_image.dart';
import '../screens/otp-screen.dart';
import '../widgets/login-form.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _number = '';

  void getOtp() {
    Navigator.of(context).pushNamed(OtpScreen.routeName, arguments: _number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            LoginImage(),
            LoginForm(
              textFieldOnChanged: (value) {
                _number = value;
              },
              buttonFunc: getOtp,
            ),
          ],
        ),
      ),
    );
  }
}
