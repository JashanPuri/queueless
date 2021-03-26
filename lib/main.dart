import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './covid_dashboard/covidDashboard.dart';
import './covid_dashboard/covid_data_provider.dart';
import 'scrollbehavior.dart';
import './auth/screens/otp-screen.dart';
import './auth/screens/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CovidDataProvider(),
        ),
      ],
      child: MaterialApp(
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
          OtpScreen.routeName: (context) => OtpScreen(),
          CovidDashboard.routeName: (context) => CovidDashboard(),
        },
      ),
    );
  }
}
