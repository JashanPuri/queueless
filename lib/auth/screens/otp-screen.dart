import 'package:flutter/material.dart';
import '../../home_dashboard.dart/screens/home_dashboard.dart';
import '../widgets/login_image.dart';
import '../widgets/otp-form.dart';

class OtpScreen extends StatefulWidget {
  static const routeName = '/otp_screen';

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  void confirmOtp() {
    print("OTP = $_otp");
    while(Navigator.of(context).canPop()){
      Navigator.of(context).pop();
    }
    Navigator.of(context).pushReplacementNamed(
      HomeDashboard.routeName,
    );
  }

  String _otp = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            LoginImage(),
            OtpForm(
              number: ModalRoute.of(context).settings.arguments as String,
              textFieldOnChanged: (value) {
                _otp = value;
              },
              buttonFunc: confirmOtp,
            )
          ],
        ),
      ),
    );
  }
}
