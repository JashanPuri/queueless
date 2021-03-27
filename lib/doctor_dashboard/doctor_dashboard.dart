import 'package:flutter/material.dart';
import 'package:queueless/common-widgets/text_widget.dart';

class DoctorDashboard extends StatefulWidget {
  static const routeName = 'doctor-dashboard';
  @override
  _DoctorDashboardState createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 30,top: 20),
              child: TextWidget("Hello",))
          ],
        ),
      ),
    );
  }
}
